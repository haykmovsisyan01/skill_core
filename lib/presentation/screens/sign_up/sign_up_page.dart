import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/config/strings.dart';
import 'package:skill_core/config/utils.dart';
import 'package:skill_core/presentation/providers/auth_provider.dart';
import 'package:skill_core/presentation/routes.dart';
import 'package:skill_core/presentation/widgets/sc_button.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';

import '../../widgets/sc_text_field.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode passwordConfirmNode = FocusNode();

  bool isVisiblePassword = false;
  bool isVisiblePasswordConfirm = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AuthState>>(authNotifierProvider, (prev, next) {
      next.when(
        data: (state) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message!)));
          context.pushReplacement(loginRoute);
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ScText(signUp, fontSize: 40),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 10,
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
                      labelText: email,
                    ),
                    ScTextField(
                      padding: EdgeInsets.all(10),
                      controller: passwordController,
                      focusNode: passwordNode,
                      validator: validatePassword,
                      keyboardType: TextInputType.visiblePassword,
                      labelText: password,
                      obscureText: !isVisiblePassword,
                      onFieldSubmitted: (data) {
                        FocusScope.of(
                          context,
                        ).requestFocus(passwordConfirmNode);
                      },
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
                    ScTextField(
                      padding: EdgeInsets.all(10),
                      controller: passwordConfirmController,
                      focusNode: passwordConfirmNode,
                      validator: (data) {
                        return data?.trim() == passwordController.text.trim()
                            ? null
                            : 'Passwords dont match!';
                      },
                      keyboardType: TextInputType.visiblePassword,
                      labelText: confirmPassword,
                      obscureText: !isVisiblePasswordConfirm,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisiblePasswordConfirm
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisiblePasswordConfirm =
                                !isVisiblePasswordConfirm;
                          });
                        },
                      ),
                    ),
                    ScButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ref
                              .read(authNotifierProvider.notifier)
                              .register(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                        }
                      },
                      child: ScText(signUp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    passwordConfirmNode.dispose();
    super.dispose();
  }
}
