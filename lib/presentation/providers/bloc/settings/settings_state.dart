part of 'settings_bloc.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitialState extends SettingsState {}

final class SettingsThemeFetchedState extends SettingsState {
  final String themeMode;

  SettingsThemeFetchedState(this.themeMode);
}

final class SettingsErrorState extends SettingsState {
  final String message;

  SettingsErrorState(this.message);
}
