import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_core/domain/usecases/local/shared_pref_usecase.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final SharedPrefUseCase useCase;

  InitBloc(this.useCase) : super(InitInitialState()) {
    on<InitCheckEvent>(checkInit);
  }

  checkInit(InitCheckEvent event, Emitter<InitState> emit) async {
    await Future.delayed(Duration(milliseconds: 800));
    if (useCase.get('token') == null) {
      emit(InitCheckedState(false));
    } else {
      emit(InitCheckedState(true));
    }
  }
}
