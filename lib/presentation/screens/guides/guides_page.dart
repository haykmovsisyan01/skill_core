import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_core/presentation/widgets/guide.dart';

import '../../providers/bloc/guide/guide_bloc.dart';
import '../../widgets/sc_text.dart';

class GuidesPage extends StatefulWidget {
  const GuidesPage({super.key});

  @override
  State<GuidesPage> createState() => _GuidesPageState();
}

class _GuidesPageState extends State<GuidesPage> {
  @override
  void initState() {
    context.read<GuideBloc>().add(GuideFetchAllEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuideBloc, GuideState>(
      builder: (context, state) {
        if (state is GuideLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is GuideAllFetchedState) {
          return ListView.builder(
            itemCount: state.guides.length,
            itemBuilder: (context, index) {
              return GuideWidget(state.guides[index]);
            },
          );
        }
        if (state is GuideErrorInFetchState) {
          return Center(child: ScText(state.message, color: Colors.red));
        } else {
          return Center(
            child: ScText(
              'Something went wrong. Please restart application',
              color: Colors.red,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
