import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc() : super(InitInitialState()) {
    on<InitCheckEvent>(checkInit);
  }
  checkInit(InitCheckEvent event, Emitter<InitState> emit) async {
    await Future.delayed(Duration(seconds: 2));

    /// if(isAuthorizedUsecase()) {...}
    emit(InitCheckedState(false));
  }
}
