import 'package:flutter/material.dart';

enum AppLocalePreference {
  system(null),
  arabic(Locale('ar')),
  english(Locale('en'));

  const AppLocalePreference(this.locale);

  final Locale? locale;

  String get storageValue => name;

  static AppLocalePreference fromStorage(String? value) {
    return AppLocalePreference.values.cast<AppLocalePreference?>().firstWhere(
          (candidate) => candidate?.name == value,
          orElse: () => AppLocalePreference.arabic,
        ) ??
        AppLocalePreference.arabic;
  }
}
