import 'package:flutter/cupertino.dart';
import 'package:skill_core/domain/usecases/firestore/fetch_all_tests_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/test_model.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final FetchAllTestsUseCase useCase;

  TestBloc(this.useCase) : super(TestInitialState()) {
    on<TestFetchAllEvent>(fetchAllTests);
  }

  fetchAllTests(TestFetchAllEvent event, Emitter<TestState> emit) async {
    emit(TestLoadingState());

    final result = await useCase.fetchAllTests();

    if (result.failed) {
      emit(TestErrorInFetchState(result.message!));
    } else {
      emit(TestAllFetchedState(result.data!));
    }
  }
}
