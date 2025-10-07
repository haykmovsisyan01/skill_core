import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/data/models/guide_model.dart';
import 'package:skill_core/presentation/routes.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';

class GuideWidget extends StatelessWidget {
  final GuideModel guide;

  const GuideWidget(this.guide, {super.key});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScText(
                      guide.title,
                      fontSize: 18,
                      maxLines: 2,
                      overFlow: TextOverflow.ellipsis,
                    ),
                    ScText(guide.author),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  context.push(guideRoute, extra: guide);
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
