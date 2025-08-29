import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/presentation/providers/auth_provider.dart';
import 'package:skill_core/presentation/routes.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';
import 'package:skill_core/presentation/widgets/sc_text_field.dart';

import '../../../config/utils.dart';
import '../../widgets/sc_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AuthState>>(authNotifierProvider, (prev, next) {
      next.when(
        data: (state) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          context.go(homeRoute, extra: state.user);
        },
        error: (error, stackTrace) {
          print('Error');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text((error as AuthState).message)));
        },
        loading: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Center(child: CircularProgressIndicator())),
          );
        },
      );
    });
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ScText('Log in', fontSize: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ScTextField(
                    padding: EdgeInsets.all(10),
                    controller: emailController,
                    focusNode: emailNode,
                    validator: validateEmail,
                    onFieldSubmitted: (data) {
                      FocusScope.of(context).requestFocus(passwordNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
                  ),
                  ScTextField(
                    padding: EdgeInsets.all(10),
                    controller: passwordController,
                    focusNode: passwordNode,
                    validator: validatePassword,
                    keyboardType: TextInputType.visiblePassword,
                    labelText: 'Password',
                    obscureText: !isVisiblePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisiblePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isVisiblePassword = !isVisiblePassword;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            ScButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ref
                      .read(authNotifierProvider.notifier)
                      .login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                }
                print('Login');
              },
              child: ScText('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
