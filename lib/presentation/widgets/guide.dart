import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/data/models/guide_model.dart';
import 'package:skill_core/presentation/routes.dart';
import 'package:skill_core/presentation/widgets/sc_button.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';

class GuideWidget extends StatelessWidget {
  final GuideModel guide;

  const GuideWidget(this.guide, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            ScText(guide.title),
            ScText(guide.author),
            ScButton(
              onPressed: () {
                context.push(guideRoute, extra: guide);
              },
              child: ScText('Read ->'),
            ),
          ],
        ),
      ),
    );
  }
}
