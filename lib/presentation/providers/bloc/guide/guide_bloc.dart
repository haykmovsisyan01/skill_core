import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_core/data/models/guide_model.dart';
import 'package:skill_core/domain/usecases/firestore/fetch_all_guides_usecase.dart';

part 'guide_event.dart';
part 'guide_state.dart';

class GuideBloc extends Bloc<GuideEvent, GuideState> {
  final FetchAllGuidesUseCase useCase;

  GuideBloc(this.useCase) : super(GuideInitialState()) {
    on<GuideFetchAllEvent>(fetchAllGuides);
  }

  fetchAllGuides(GuideFetchAllEvent event, Emitter<GuideState> emit) async {
    emit(GuideLoadingState());

    final result = await useCase.fetchAllGuides();

    if (result.failed) {
      emit(GuideErrorInFetchState(result.message!));
    } else {
      emit(GuideAllFetchedState(result.data!));
    }
  }
}
