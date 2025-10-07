import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/presentation/routes.dart';
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
          child: Row(
            children: [
              Expanded(
                child: ScText(
                  test.title,
                  fontSize: 18,
                  maxLines: 2,
                  overFlow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.push(testRoute, extra: test);
                },
                icon: Icon(Icons.navigate_next, size: 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
