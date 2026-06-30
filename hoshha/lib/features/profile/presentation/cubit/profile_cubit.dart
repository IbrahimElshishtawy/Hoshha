import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user_profile.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void loadProfile() {
    emit(ProfileLoading());

    // Mock load
    Future.delayed(const Duration(milliseconds: 300), () {
      emit(const ProfileLoaded(
        user: UserProfile(
          name: 'عبدالله الششتواي',
          email: 'abdullah@hoshha.com',
          darkMode: false,
          pushNotifications: true,
          selectedCurrency: 'SAR',
          selectedLanguage: 'ar',
        ),
      ));
    });
  }

  void toggleDarkMode(bool value) {
    if (state is! ProfileLoaded) return;
    final user = (state as ProfileLoaded).user;
    emit(ProfileLoaded(user: user.copyWith(darkMode: value)));
  }

  void toggleNotifications(bool value) {
    if (state is! ProfileLoaded) return;
    final user = (state as ProfileLoaded).user;
    emit(ProfileLoaded(user: user.copyWith(pushNotifications: value)));
  }

  void setCurrency(String currency) {
    if (state is! ProfileLoaded) return;
    final user = (state as ProfileLoaded).user;
    emit(ProfileLoaded(user: user.copyWith(selectedCurrency: currency)));
  }

  void setLanguage(String language) {
    if (state is! ProfileLoaded) return;
    final user = (state as ProfileLoaded).user;
    emit(ProfileLoaded(user: user.copyWith(selectedLanguage: language)));
  }
}
