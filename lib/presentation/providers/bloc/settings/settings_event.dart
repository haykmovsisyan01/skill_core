part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

final class SettingsSetInitialThemeEvent extends SettingsEvent {
  final String themeMode;

  SettingsSetInitialThemeEvent(this.themeMode);
}

final class SettingsGetThemeEvent extends SettingsEvent {}

final class SettingsChangeThemeEvent extends SettingsEvent {
  final String themeMode;

  SettingsChangeThemeEvent(this.themeMode);
}
