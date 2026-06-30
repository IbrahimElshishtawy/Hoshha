import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void loadProfile() {
    emit(ProfileLoading());

    // Mock load
    Future.delayed(const Duration(milliseconds: 300), () {
      emit(const ProfileLoaded(
        name: 'عبدالله الششتواي',
        email: 'abdullah@hoshha.com',
        darkMode: false,
        pushNotifications: true,
        selectedCurrency: 'SAR',
        selectedLanguage: 'ar',
      ));
    });
  }

  void toggleDarkMode(bool value) {
    if (state is! ProfileLoaded) return;
    emit((state as ProfileLoaded).copyWith(darkMode: value));
  }

  void toggleNotifications(bool value) {
    if (state is! ProfileLoaded) return;
    emit((state as ProfileLoaded).copyWith(pushNotifications: value));
  }

  void setCurrency(String currency) {
    if (state is! ProfileLoaded) return;
    emit((state as ProfileLoaded).copyWith(selectedCurrency: currency));
  }

  void setLanguage(String language) {
    if (state is! ProfileLoaded) return;
    emit((state as ProfileLoaded).copyWith(selectedLanguage: language));
  }
}
