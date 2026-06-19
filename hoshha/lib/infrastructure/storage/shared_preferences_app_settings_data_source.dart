import 'package:shared_preferences/shared_preferences.dart';

class StoredAppSettings {
  const StoredAppSettings({
    required this.themePreference,
    required this.localePreference,
    required this.onboardingCompleted,
  });

  final String? themePreference;
  final String? localePreference;
  final bool? onboardingCompleted;
}

abstract interface class AppSettingsLocalDataSource {
  StoredAppSettings readSettings();

  Future<void> writeThemePreference(String value);

  Future<void> writeLocalePreference(String value);

  Future<void> writeOnboardingCompleted(bool isCompleted);
}

class SharedPreferencesAppSettingsDataSource
    implements AppSettingsLocalDataSource {
  SharedPreferencesAppSettingsDataSource(this._preferences);

  static const _themePreferenceKey = 'app_settings.theme_preference';
  static const _localePreferenceKey = 'app_settings.locale_preference';
  static const _onboardingCompletedKey = 'app_settings.onboarding_completed';

  final SharedPreferences _preferences;

  @override
  StoredAppSettings readSettings() {
    return StoredAppSettings(
      themePreference: _preferences.getString(_themePreferenceKey),
      localePreference: _preferences.getString(_localePreferenceKey),
      onboardingCompleted: _preferences.getBool(_onboardingCompletedKey),
    );
  }

  @override
  Future<void> writeLocalePreference(String value) async {
    await _write(() => _preferences.setString(_localePreferenceKey, value));
  }

  @override
  Future<void> writeOnboardingCompleted(bool isCompleted) async {
    await _write(
      () => _preferences.setBool(_onboardingCompletedKey, isCompleted),
    );
  }

  @override
  Future<void> writeThemePreference(String value) async {
    await _write(() => _preferences.setString(_themePreferenceKey, value));
  }

  Future<void> _write(Future<bool> Function() action) async {
    final saved = await action();
    if (!saved) {
      throw StateError('Failed to persist app settings.');
    }
  }
}
