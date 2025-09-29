import 'package:flutter/material.dart';
import 'package:skill_core/data/models/guide_model.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  late GuideModel model;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    model = ModalRoute.of(context)!.settings.arguments as GuideModel;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ScText(model.title, fontSize: 30),
          ScText(model.author, fontSize: 15),
          ScText(model.content),
        ],
      ),
    );
  }
}
