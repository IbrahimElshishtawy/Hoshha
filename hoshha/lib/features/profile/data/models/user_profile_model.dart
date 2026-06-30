import '../../domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.name,
    required super.email,
    required super.darkMode,
    required super.pushNotifications,
    required super.selectedCurrency,
    required super.selectedLanguage,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] as String,
      email: json['email'] as String,
      darkMode: json['darkMode'] as bool,
      pushNotifications: json['pushNotifications'] as bool,
      selectedCurrency: json['selectedCurrency'] as String,
      selectedLanguage: json['selectedLanguage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'darkMode': darkMode,
      'pushNotifications': pushNotifications,
      'selectedCurrency': selectedCurrency,
      'selectedLanguage': selectedLanguage,
    };
  }
}
