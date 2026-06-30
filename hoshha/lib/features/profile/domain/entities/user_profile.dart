import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String name;
  final String email;
  final bool darkMode;
  final bool pushNotifications;
  final String selectedCurrency;
  final String selectedLanguage;

  const UserProfile({
    required this.name,
    required this.email,
    required this.darkMode,
    required this.pushNotifications,
    required this.selectedCurrency,
    required this.selectedLanguage,
  });

  UserProfile copyWith({
    String? name,
    String? email,
    bool? darkMode,
    bool? pushNotifications,
    String? selectedCurrency,
    String? selectedLanguage,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      darkMode: darkMode ?? this.darkMode,
      pushNotifications: pushNotifications ?? this.pushNotifications,
      selectedCurrency: selectedCurrency ?? this.selectedCurrency,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        darkMode,
        pushNotifications,
        selectedCurrency,
        selectedLanguage,
      ];
}
