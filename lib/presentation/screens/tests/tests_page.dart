import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_core/presentation/providers/bloc/test/test_bloc.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';
import 'package:skill_core/presentation/widgets/test.dart';

class TestsPage extends StatefulWidget {
  const TestsPage({super.key});

  @override
  State<TestsPage> createState() => _TestsPageState();
}

class _TestsPageState extends State<TestsPage> {
  @override
  void initState() {
    context.read<TestBloc>().add(TestFetchAllEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        if (state is TestLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is TestAllFetchedState) {
          return ListView.builder(
            itemCount: state.tests.length,
            itemBuilder: (context, index) {
              return TestWidget(state.tests[index]);
            },
          );
        }
        if (state is TestErrorInFetchState) {
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
}
