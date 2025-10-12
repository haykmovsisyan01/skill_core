part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {}

final class QuizInitialState extends QuizState {}

final class QuizStartedState extends QuizState {}

final class QuizNewQuestionState extends QuizState {
  final int questionId;

  QuizNewQuestionState(this.questionId);
}

final class QuizRightAnswerState extends QuizState {
  final int answerId;

  QuizRightAnswerState(this.answerId);
}

final class QuizWrongAnswerState extends QuizState {
  final int answerId;

  QuizWrongAnswerState(this.answerId);
}

final class QuizResultState extends QuizState {
  final Result result;

  QuizResultState(this.result);
}

final class QuizErrorState extends QuizState {
  final String message;

  QuizErrorState(this.message);
}
