import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/local/shared_pref_usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPrefUseCase useCase;
  late String theme;

  SettingsBloc(this.useCase) : super(SettingsInitialState()) {
    on<SettingsSetInitialThemeEvent>(_setInitialTheme);
    on<SettingsGetThemeEvent>(_getTheme);
    on<SettingsChangeThemeEvent>(_changeTheme);
  }

  _setInitialTheme(
    SettingsSetInitialThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(SettingsInitialState());

    if (useCase.get('themeMode') == null) {
      theme = event.themeMode;
      await useCase.put('themeMode', event.themeMode);
    } else {
      theme = useCase.get('themeMode') as String;
    }
    emit(SettingsThemeFetchedState(useCase.get('themeMode') as String));
  }

  _getTheme(SettingsGetThemeEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsInitialState());

    final result = useCase.get('themeMode') as String?;
    await useCase.put('themeMode', 'light');

    if (result == null) {
      emit(SettingsErrorState('Something went wrong'));
    } else {
      emit(SettingsThemeFetchedState(result));
    }
  }

  _changeTheme(
    SettingsChangeThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(SettingsInitialState());

    await useCase.put('themeMode', event.themeMode);
    theme = event.themeMode;
    final result = useCase.get('themeMode') as String?;

    if (result == null) {
      emit(SettingsErrorState('Something went wrong'));
    } else {
      emit(SettingsThemeFetchedState(result));
    }
  }
}
