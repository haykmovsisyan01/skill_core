part of 'guide_bloc.dart';

@immutable
sealed class GuideState {}

final class GuideInitialState extends GuideState {}

final class GuideLoadingState extends GuideState {}

final class GuideAllFetchedState extends GuideState {
  final List<GuideModel> guides;

  GuideAllFetchedState(this.guides);
}

final class GuideErrorInFetchState extends GuideState {
  final String message;

  GuideErrorInFetchState(this.message);
}
