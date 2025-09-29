import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_core/data/models/result_model.dart';
import 'package:skill_core/data/models/test_model.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  TestModel? currentTest;
  int currentQuestion = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;

  QuizBloc() : super(QuizInitialState()) {
    on<QuizStartEvent>(setUpNewQuiz);
    on<QuizNextQuestionEvent>(nextQuestion);
    on<QuizQuestionAnswerEvent>(checkAnswer);
    on<QuizFinishEvent>(finishQuiz);
    on<QuizDeleteEvent>(restoreQuiz);
  }

  setUpNewQuiz(QuizStartEvent event, Emitter<QuizState> emit) {
    currentTest = event.model;
    emit(QuizStartedState());
  }

  nextQuestion(QuizNextQuestionEvent event, Emitter<QuizState> emit) {
    currentQuestion++;
    emit(QuizNewQuestionState(currentQuestion));
  }

  checkAnswer(QuizQuestionAnswerEvent event, Emitter<QuizState> emit) {
    if (currentTest == null) {
      emit(QuizErrorState('Something went wrong. Please restart app'));
      return;
    }

    if (event.answer ==
        currentTest!.questions.elementAt(currentQuestion).rightAnswer) {
      correctAnswers++;
      emit(QuizRightAnswerState(currentQuestion));
    } else {
      wrongAnswers++;
      emit(QuizWrongAnswerState(currentQuestion));
    }
  }

  finishQuiz(QuizFinishEvent event, Emitter<QuizState> emit) {
    emit(
      QuizResultState(
        Result(correctAnswers: correctAnswers, wrongAnswers: wrongAnswers),
      ),
    );
  }

  restoreQuiz(QuizDeleteEvent event, Emitter<QuizState> emit) {
    currentTest = null;
    currentQuestion = 0;
    correctAnswers = 0;
    wrongAnswers = 0;
    emit(QuizInitialState());
  }
}
