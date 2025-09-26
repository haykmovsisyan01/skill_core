import 'package:flutter/cupertino.dart';
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
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            ScText(test.title),
            ScText(test.id.toString()),
            ScButton(onPressed: () {}, child: ScText('Read ->')),
          ],
        ),
      ),
    );
  }
}
