import 'package:equatable/equatable.dart';
import '../../domain/entities/app_setting.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final AppSetting setting;

  const SettingsLoaded(this.setting);

  @override
  List<Object> get props => [setting];
}

class SettingsError extends SettingsState {
  final String message;

  const SettingsError(this.message);

  @override
  List<Object> get props => [message];
}
