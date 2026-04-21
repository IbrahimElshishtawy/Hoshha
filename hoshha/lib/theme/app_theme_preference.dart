import 'package:flutter/material.dart';

enum AppThemeFamily { jade, sunset, onyx }

enum AppThemeModePreference { system, light, dark }

class AppThemePreference {
  const AppThemePreference({required this.family, required this.mode});

  const AppThemePreference.defaults()
    : this(family: AppThemeFamily.jade, mode: AppThemeModePreference.system);

  final AppThemeFamily family;
  final AppThemeModePreference mode;

  ThemeMode get themeMode {
    return switch (mode) {
      AppThemeModePreference.system => ThemeMode.system,
      AppThemeModePreference.light => ThemeMode.light,
      AppThemeModePreference.dark => ThemeMode.dark,
    };
  }

  String get storageValue => '${family.name}:${mode.name}';

  AppThemePreference copyWith({
    AppThemeFamily? family,
    AppThemeModePreference? mode,
  }) {
    return AppThemePreference(
      family: family ?? this.family,
      mode: mode ?? this.mode,
    );
  }

  static AppThemePreference fromStorage(String? value) {
    if (value == null || value.isEmpty) {
      return const AppThemePreference.defaults();
    }

    final parts = value.split(':');
    if (parts.length != 2) {
      return const AppThemePreference.defaults();
    }

    final family = AppThemeFamily.values.cast<AppThemeFamily?>().firstWhere(
      (candidate) => candidate?.name == parts[0],
      orElse: () => null,
    );
    final mode = AppThemeModePreference.values
        .cast<AppThemeModePreference?>()
        .firstWhere(
          (candidate) => candidate?.name == parts[1],
          orElse: () => null,
        );

    if (family == null || mode == null) {
      return const AppThemePreference.defaults();
    }

    return AppThemePreference(family: family, mode: mode);
  }
}
