import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skill_core/domain/usecases/shared_pref_usecase.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final SharedPrefUseCase useCase;

  InitBloc(this.useCase) : super(InitInitialState()) {
    on<InitCheckEvent>(checkInit);
  }

  checkInit(InitCheckEvent event, Emitter<InitState> emit) async {
    await Future.delayed(Duration(milliseconds: 800));
    print(useCase.get('token'));
    if (useCase.get('token') == null) {
      emit(InitCheckedState(false));
    } else {
      emit(InitCheckedState(true));
    }
  }
}
