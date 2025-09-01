import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/presentation/providers/auth_provider.dart';
import 'package:skill_core/presentation/routes.dart';
import 'package:skill_core/presentation/widgets/sc_button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<AuthState>>(authNotifierProvider, (prev, next) {
      next.when(
        data: (state) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          context.go(welcomeRoute);
        },
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text((error as AuthState).errorMessage!)),
          );
        },
        loading: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Center(child: CircularProgressIndicator())),
          );
        },
      );
    });

    return Scaffold(
      body: Center(
        child: ScButton(
          onPressed: () {
            ref.read(authNotifierProvider.notifier).signOut();
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
