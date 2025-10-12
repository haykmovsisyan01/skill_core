part of 'init_bloc.dart';

@immutable
sealed class InitState {}

final class InitInitialState extends InitState {}

final class InitCheckedState extends InitState {
  final bool isAuthorized;
  final bool isUserOptionsDefined;

  InitCheckedState({
    required this.isAuthorized,
    required this.isUserOptionsDefined,
  });
}
