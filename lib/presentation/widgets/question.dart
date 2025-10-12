import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_core/presentation/providers/bloc/quiz/quiz_bloc.dart';
import 'package:skill_core/presentation/widgets/sc_button.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';

import '../../data/models/question_model.dart';

class QuestionWidget extends StatefulWidget {
  final Question model;

  const QuestionWidget(this.model, {super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selectedAnswer;
  bool answered = false;
  bool isSelected = false;
  late int rightAnswer;

  @override
  Widget build(BuildContext context) {
    rightAnswer = widget.model.answers.toList().indexOf(
      widget.model.rightAnswer,
    );
    return BlocListener<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizStartedState) {
          answered = false;
          isSelected = false;
        }
        if (state is QuizNextQuestionEvent) {
          isSelected = false;
        }
      },
      child: Column(
        children: [
          ScText(widget.model.question, fontSize: 20),
          GridView.builder(
            shrinkWrap: true,
            itemCount: widget.model.answers.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              isSelected = selectedAnswer == index;

              if (index == rightAnswer) {
                isSelected = true;
              }

              return IgnorePointer(
                ignoring: answered,
                child: GestureDetector(
                  onTap: () {
                    answered = true;
                    selectedAnswer = index;
                    context.read<QuizBloc>().add(
                      QuizQuestionAnswerEvent(
                        widget.model.answers.elementAt(index),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? getColor(index)
                          : Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: ScText(
                        widget.model.answers.elementAt(index),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          if (context.read<QuizBloc>().currentQuestion ==
              context.read<QuizBloc>().currentTest!.questions.length - 1)
            ScButton(
              onPressed: () {
                answered = false;
                context.read<QuizBloc>().add(QuizFinishEvent());
              },
              child: ScText('Finish'),
            ),
          if (context.read<QuizBloc>().currentQuestion !=
              context.read<QuizBloc>().currentTest!.questions.length - 1)
            ScButton(
              onPressed: () {
                answered = false;
                context.read<QuizBloc>().add(QuizNextQuestionEvent());
              },
              child: ScText('Next Question'),
            ),
        ],
      ),
    );
  }

  Color getColor(int index) {
    if (!answered) {
      return Theme.of(context).secondaryHeaderColor;
    }
    if (index == rightAnswer) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
