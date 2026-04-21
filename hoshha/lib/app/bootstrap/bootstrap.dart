import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/config/app_environment.dart';
import '../../core/logging/app_logger.dart';
import '../../core/time/clock.dart';
import '../../infrastructure/database/app_database.dart';
import '../../infrastructure/database/database_providers.dart';
import '../../infrastructure/storage/storage_providers.dart';
import '../app_providers.dart';
import 'app_bootstrap_controller.dart';
import 'app_provider_observer.dart';

Future<void> bootstrap(Widget app) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final environment = AppEnvironment.fromBuild();
    final logger = DebugAppLogger();
    final sharedPreferences = await SharedPreferences.getInstance();
    final isar = await openAppDatabase();
    final container = ProviderContainer(
      observers: [AppProviderObserver(logger)],
      overrides: [
        appEnvironmentProvider.overrideWithValue(environment),
        appLoggerProvider.overrideWithValue(logger),
        clockProvider.overrideWithValue(const SystemClock()),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        isarProvider.overrideWithValue(isar),
      ],
    );

    FlutterError.onError = (details) {
      logger.error('Unhandled Flutter error', details.exception, details.stack);
    };
    WidgetsBinding.instance.platformDispatcher.onError = (error, stackTrace) {
      logger.error('Unhandled platform error', error, stackTrace);
      return true;
    };
    unawaited(container.read(appBootstrapControllerProvider.future));

    runApp(UncontrolledProviderScope(container: container, child: app));
  }, (error, stackTrace) {
    DebugAppLogger().error('Unhandled zone error', error, stackTrace);
  });
}
