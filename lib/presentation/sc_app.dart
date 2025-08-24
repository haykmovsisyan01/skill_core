import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:skill_core/presentation/providers/bloc/init/init_bloc.dart';
import 'package:skill_core/presentation/routes.dart';

import '../config/colors.dart';

class SCApp extends StatelessWidget {
  const SCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InitBloc()..add(InitCheckEvent())),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(primaryColor: primaryColor),
      ),
    );
  }
}
