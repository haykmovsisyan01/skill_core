import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_core/data/models/test_model.dart';
import 'package:skill_core/presentation/providers/bloc/quiz/quiz_bloc.dart';
import 'package:skill_core/presentation/widgets/question.dart';
import 'package:skill_core/presentation/widgets/sc_button.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late TestModel model;

  @override
  Widget build(BuildContext context) {
    model = ModalRoute.of(context)!.settings.arguments as TestModel;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ScText(model.title, fontSize: 30),
          ScText(model.description, fontSize: 15),
          ScButton(
            onPressed: () {
              context.read<QuizBloc>().add(QuizDeleteEvent());
              context.read<QuizBloc>().add(QuizStartEvent(model));
            },
            child: ScText('Start quiz'),
          ),

          BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state is QuizInitialState) {
                return Center(child: ScText('No started quiz', fontSize: 30));
              }
              if (state is QuizStartedState) {
                return QuestionWidget(model.questions.elementAt(0));
              }
              if (state is QuizNewQuestionState) {
                return QuestionWidget(
                  model.questions.elementAt(state.questionId),
                );
              }
              if (state is QuizRightAnswerState) {
                return QuestionWidget(
                  model.questions.elementAt(state.answerId),
                );
              }
              if (state is QuizWrongAnswerState) {
                return QuestionWidget(
                  model.questions.elementAt(state.answerId),
                );
              }
              if (state is QuizResultState) {
                return ScText(state.result.accuracy.toString());
              } else {
                return ScText('Error');
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void deactivate() {
    context.read<QuizBloc>().add(QuizDeleteEvent());
    super.deactivate();
  }
}
