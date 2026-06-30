import '../../domain/entities/app_setting.dart';

class AppSettingModel extends AppSetting {
  const AppSettingModel({
    super.isDarkMode,
    super.languageCode,
    super.currency,
    super.isBiometricEnabled,
    super.notificationsEnabled,
  });

  factory AppSettingModel.fromJson(Map<String, dynamic> json) {
    return AppSettingModel(
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      languageCode: json['languageCode'] as String? ?? 'ar',
      currency: json['currency'] as String? ?? 'SAR',
      isBiometricEnabled: json['isBiometricEnabled'] as bool? ?? true,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isDarkMode': isDarkMode,
      'languageCode': languageCode,
      'currency': currency,
      'isBiometricEnabled': isBiometricEnabled,
      'notificationsEnabled': notificationsEnabled,
    };
  }
}
