import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/presentation/routes.dart';

import '../providers/bloc/init/init_bloc.dart';

class AppManager extends StatefulWidget {
  const AppManager({super.key});

  @override
  State<AppManager> createState() => _AppManagerState();
}

class _AppManagerState extends State<AppManager> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InitBloc, InitState>(
      listener: (context, state) {
        if (state is InitInitialState) {}
        if (state is InitCheckedState) {
          removeSplashScreen();
          if (state.isAuthorized) {
            context.go(homeRoute);
          } else {
            context.go(welcomeRoute);
          }
        }
      },
      child: Placeholder(),
    );
  }

  void removeSplashScreen() {
    FlutterNativeSplash.remove();
  }
}
