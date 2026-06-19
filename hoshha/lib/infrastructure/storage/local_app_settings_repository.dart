import '../../app/settings/app_settings.dart';
import '../../app/settings/app_settings_repository.dart';
import '../../localization/app_locale_preference.dart';
import '../../theme/app_theme_preference.dart';
import 'shared_preferences_app_settings_data_source.dart';

class LocalAppSettingsRepository implements AppSettingsRepository {
  LocalAppSettingsRepository(this._dataSource);

  final AppSettingsLocalDataSource _dataSource;

  @override
  Future<AppSettings> loadSettings() async {
    final stored = _dataSource.readSettings();

    return AppSettings(
      themePreference: AppThemePreference.fromStorage(stored.themePreference),
      localePreference: AppLocalePreference.fromStorage(
        stored.localePreference,
      ),
      onboardingCompleted: stored.onboardingCompleted ?? false,
    );
  }

  @override
  Future<void> saveLocalePreference(AppLocalePreference preference) {
    return _dataSource.writeLocalePreference(preference.storageValue);
  }

  @override
  Future<void> saveOnboardingCompleted(bool isCompleted) {
    return _dataSource.writeOnboardingCompleted(isCompleted);
  }

  @override
  Future<void> saveThemePreference(AppThemePreference preference) {
    return _dataSource.writeThemePreference(preference.storageValue);
  }
}
