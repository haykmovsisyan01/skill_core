part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

final class QuizStartEvent extends QuizEvent {
  final TestModel model;

  QuizStartEvent(this.model);
}

final class QuizNextQuestionEvent extends QuizEvent {}

final class QuizFinishEvent extends QuizEvent {}

final class QuizQuestionAnswerEvent extends QuizEvent {
  final String answer;

  QuizQuestionAnswerEvent(this.answer);
}

final class QuizDeleteEvent extends QuizEvent {}
