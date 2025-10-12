import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_core/domain/usecases/firestore/user_firestore_usecase.dart';
import 'package:skill_core/domain/usecases/local/shared_pref_usecase.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final SharedPrefUseCase useCase;
  final UserFireStoreUseCase fireStoreUseCase;

  InitBloc(this.useCase, this.fireStoreUseCase) : super(InitInitialState()) {
    on<InitCheckEvent>(checkInit);
  }

  checkInit(InitCheckEvent event, Emitter<InitState> emit) async {
    final userUid = useCase.get('token') as String?;

    if (userUid == null) {
      emit(InitCheckedState(isAuthorized: false, isUserOptionsDefined: false));
      return;
    }

    final user = await fireStoreUseCase.fetchUserEntity(userUid);

    if (user.data?.name == null || user.data?.surname == null) {
      emit(InitCheckedState(isAuthorized: true, isUserOptionsDefined: false));
    } else {
      emit(InitCheckedState(isAuthorized: true, isUserOptionsDefined: true));
    }
  }
}
