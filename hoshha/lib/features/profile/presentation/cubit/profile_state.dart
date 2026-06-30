import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name;
  final String email;
  final bool darkMode;
  final bool pushNotifications;
  final String selectedCurrency;
  final String selectedLanguage;

  const ProfileLoaded({
    required this.name,
    required this.email,
    required this.darkMode,
    required this.pushNotifications,
    required this.selectedCurrency,
    required this.selectedLanguage,
  });

  ProfileLoaded copyWith({
    String? name,
    String? email,
    bool? darkMode,
    bool? pushNotifications,
    String? selectedCurrency,
    String? selectedLanguage,
  }) {
    return ProfileLoaded(
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
