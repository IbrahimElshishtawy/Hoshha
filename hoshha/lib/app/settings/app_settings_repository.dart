import '../../localization/app_locale_preference.dart';
import '../../theme/app_theme_preference.dart';
import 'app_settings.dart';

abstract interface class AppSettingsRepository {
  Future<AppSettings> loadSettings();

  Future<void> saveThemePreference(AppThemePreference preference);

  Future<void> saveLocalePreference(AppLocalePreference preference);

  Future<void> saveOnboardingCompleted(bool isCompleted);
}
