import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/storage/storage_providers.dart';
import '../app_providers.dart';
import '../settings/app_settings.dart';

class AppBootstrapState {
  const AppBootstrapState({
    required this.settings,
    required this.usedFallbackSettings,
  });

  final AppSettings settings;
  final bool usedFallbackSettings;
}

class AppBootstrapController extends AsyncNotifier<AppBootstrapState> {
  @override
  Future<AppBootstrapState> build() async {
    final repository = ref.watch(appSettingsRepositoryProvider);
    final logger = ref.watch(appLoggerProvider);

    try {
      final settings = await repository.loadSettings();
      return AppBootstrapState(settings: settings, usedFallbackSettings: false);
    } catch (error, stackTrace) {
      logger.error(
        'Failed to load app settings during bootstrap',
        error,
        stackTrace,
      );
      return const AppBootstrapState(
        settings: AppSettings.defaults(),
        usedFallbackSettings: true,
      );
    }
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }
}

final appBootstrapControllerProvider =
    AsyncNotifierProvider<AppBootstrapController, AppBootstrapState>(
      AppBootstrapController.new,
      name: 'appBootstrapControllerProvider',
    );
