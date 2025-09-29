import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_core/presentation/providers/bloc/quiz/quiz_bloc.dart';
import 'package:skill_core/presentation/widgets/sc_button.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';

import '../../data/models/question_model.dart';

class QuestionWidget extends StatefulWidget {
  final Question model;
  final Color color;

  const QuestionWidget(this.model, {this.color = Colors.white, super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selectedAnswer;
  bool answered = false;
  late int rightAnswer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    rightAnswer = widget.model.answers.toList().indexOf(
      widget.model.rightAnswer,
    );
    return Column(
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
            bool isSelected = selectedAnswer == index;

            if (index == rightAnswer) {
              isSelected = true;
            }
            return ColoredBox(
              color: isSelected ? getColor(index) : Colors.white,
              //   width: MediaQuery.sizeOf(context).width / 4,
              //   height: MediaQuery.sizeOf(context).width / 2,
              child: IgnorePointer(
                ignoring: answered,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      answered = true;
                      selectedAnswer = index;
                      context.read<QuizBloc>().add(
                        QuizQuestionAnswerEvent(
                          widget.model.answers.elementAt(index),
                        ),
                      );
                    });
                  },
                  child: ScText(widget.model.answers.elementAt(index)),
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
    );
  }

  Color getColor(int index) {
    if (!answered) {
      return Colors.white;
    }
    if (index == rightAnswer) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
