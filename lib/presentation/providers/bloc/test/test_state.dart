part of 'test_bloc.dart';

@immutable
sealed class TestState {}

final class TestInitialState extends TestState {}

final class TestLoadingState extends TestState {}

final class TestAllFetchedState extends TestState {
  final List<TestModel> tests;

  TestAllFetchedState(this.tests);
}

final class TestErrorInFetchState extends TestState {
  final String message;

  TestErrorInFetchState(this.message);
}
