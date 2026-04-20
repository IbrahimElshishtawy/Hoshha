import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/logging/app_logger.dart';
import 'app_provider_observer.dart';

void bootstrap(Widget app) {
  final logger = DebugAppLogger();

  FlutterError.onError = (details) {
    logger.error('Unhandled Flutter error', details.exception, details.stack);
  };

  runZonedGuarded(
    () => runApp(
      ProviderScope(observers: [AppProviderObserver(logger)], child: app),
    ),
    (error, stackTrace) {
      logger.error('Unhandled zone error', error, stackTrace);
    },
  );
}
