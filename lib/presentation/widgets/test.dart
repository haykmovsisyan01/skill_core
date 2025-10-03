import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/presentation/routes.dart';
import 'package:skill_core/presentation/widgets/sc_button.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';

import '../../data/models/test_model.dart';

class TestWidget extends StatelessWidget {
  final TestModel test;

  const TestWidget(this.test, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        constraints: BoxConstraints(minHeight: 120),
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScText(test.title, fontSize: 25),
              ScButton(
                onPressed: () {
                  context.push(testRoute, extra: test);
                },
                child: ScText('Pass', fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
