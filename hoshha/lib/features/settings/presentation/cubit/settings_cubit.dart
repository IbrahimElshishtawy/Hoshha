import 'package:flutter_bloc/flutter_bloc.dart';
import 'settings_state.dart';
import '../../domain/entities/app_setting.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  void loadSettings() {
    emit(SettingsLoading());
    // Simulate loading
    const defaultSettings = AppSetting();
    emit(const SettingsLoaded(defaultSettings));
  }

  void toggleDarkMode(bool isDark) {
    if (state is SettingsLoaded) {
      final currentState = state as SettingsLoaded;
      final newSetting = currentState.setting.copyWith(isDarkMode: isDark);
      emit(SettingsLoaded(newSetting));
    }
  }

  void toggleBiometric(bool isEnabled) {
    if (state is SettingsLoaded) {
      final currentState = state as SettingsLoaded;
      final newSetting = currentState.setting.copyWith(isBiometricEnabled: isEnabled);
      emit(SettingsLoaded(newSetting));
    }
  }
}
