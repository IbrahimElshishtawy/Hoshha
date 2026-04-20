import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/bootstrap/app_bootstrap_controller.dart';
import '../infrastructure/storage/storage_providers.dart';
import 'app_theme_preference.dart';
import 'theme_factory.dart';

class AppThemeConfiguration {
  const AppThemeConfiguration({
    required this.theme,
    required this.darkTheme,
    required this.themeMode,
    required this.preference,
  });

  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
  final AppThemePreference preference;
}

class ThemeController extends AsyncNotifier<AppThemePreference> {
  @override
  Future<AppThemePreference> build() async {
    final bootstrap = await ref.watch(appBootstrapControllerProvider.future);
    return bootstrap.settings.themePreference;
  }

  Future<void> updatePreference(AppThemePreference preference) async {
    final previous = state.asData?.value;
    state = AsyncData(preference);

    try {
      await ref
          .read(appSettingsRepositoryProvider)
          .saveThemePreference(preference);
    } catch (error, stackTrace) {
      if (previous != null) {
        state = AsyncData(previous);
      } else {
        state = AsyncError(error, stackTrace);
      }
      rethrow;
    }
  }

  Future<void> updateFamily(AppThemeFamily family) {
    final current = state.asData?.value ?? const AppThemePreference.defaults();
    return updatePreference(current.copyWith(family: family));
  }

  Future<void> updateMode(AppThemeModePreference mode) {
    final current = state.asData?.value ?? const AppThemePreference.defaults();
    return updatePreference(current.copyWith(mode: mode));
  }
}

final themeControllerProvider =
    AsyncNotifierProvider<ThemeController, AppThemePreference>(
      ThemeController.new,
      name: 'themeControllerProvider',
    );

final appThemeConfigurationProvider = Provider<AppThemeConfiguration>((ref) {
  final preference =
      ref.watch(themeControllerProvider).asData?.value ??
      const AppThemePreference.defaults();

  return AppThemeConfiguration(
    preference: preference,
    theme: ThemeFactory.build(
      family: preference.family,
      brightness: Brightness.light,
    ),
    darkTheme: ThemeFactory.build(
      family: preference.family,
      brightness: Brightness.dark,
    ),
    themeMode: preference.themeMode,
  );
}, name: 'appThemeConfigurationProvider');
