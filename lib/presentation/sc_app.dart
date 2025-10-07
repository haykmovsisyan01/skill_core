import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_core/presentation/providers/bloc/guide/guide_bloc.dart';
import 'package:skill_core/presentation/providers/bloc/init/init_bloc.dart';
import 'package:skill_core/presentation/providers/bloc/quiz/quiz_bloc.dart';
import 'package:skill_core/presentation/providers/bloc/test/test_bloc.dart';
import 'package:skill_core/presentation/providers/dependencies.dart';
import 'package:skill_core/presentation/routes.dart';

import '../config/colors.dart';
import '../config/constants.dart';

class SCApp extends ConsumerWidget {
  const SCApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => InitBloc(
            ref.read(sharedPreferencesUseCase),
            ref.read(userFireStoreUseCase),
          )..add(InitCheckEvent()),
        ),
        BlocProvider(create: (_) => GuideBloc(ref.read(fetchAllGuidesUseCase))),
        BlocProvider(create: (_) => TestBloc(ref.read(fetchAllTestsUseCase))),
        BlocProvider(create: (_) => QuizBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
