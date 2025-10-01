part of 'init_bloc.dart';

@immutable
sealed class InitEvent {}

final class InitCheckEvent extends InitEvent {}

final class InitCheckUserOptionsDefinedEvent extends InitEvent {}
