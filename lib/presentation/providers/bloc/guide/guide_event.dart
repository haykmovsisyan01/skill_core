part of 'guide_bloc.dart';

@immutable
sealed class GuideEvent {}

class GuideFetchAllEvent extends GuideEvent {}
