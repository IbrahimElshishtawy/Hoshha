import '../../localization/app_locale_preference.dart';
import '../../theme/app_theme_preference.dart';

class AppSettings {
  const AppSettings({
    required this.themePreference,
    required this.localePreference,
    required this.onboardingCompleted,
  });

  const AppSettings.defaults()
    : this(
        themePreference: const AppThemePreference.defaults(),
        localePreference: AppLocalePreference.arabic,
        onboardingCompleted: false,
      );

  final AppThemePreference themePreference;
  final AppLocalePreference localePreference;
  final bool onboardingCompleted;

  AppSettings copyWith({
    AppThemePreference? themePreference,
    AppLocalePreference? localePreference,
    bool? onboardingCompleted,
  }) {
    return AppSettings(
      themePreference: themePreference ?? this.themePreference,
      localePreference: localePreference ?? this.localePreference,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
    );
  }
}
