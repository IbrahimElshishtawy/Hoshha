class AppSetting {
  final bool isDarkMode;
  final String languageCode;
  final String currency;
  final bool isBiometricEnabled;
  final bool notificationsEnabled;

  const AppSetting({
    this.isDarkMode = false,
    this.languageCode = 'ar',
    this.currency = 'SAR',
    this.isBiometricEnabled = true,
    this.notificationsEnabled = true,
  });

  AppSetting copyWith({
    bool? isDarkMode,
    String? languageCode,
    String? currency,
    bool? isBiometricEnabled,
    bool? notificationsEnabled,
  }) {
    return AppSetting(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
      currency: currency ?? this.currency,
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}
