import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_core/config/utils.dart';
import 'package:skill_core/presentation/providers/auth_provider.dart';
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
    // var state = ref.watch(authNotifierProvider.notifier);

    ref.listen<AsyncValue<AuthState>>(authNotifierProvider, (prev, next) {
      next.when(
        data: (state) {
          print('Success');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ScText('Sign Up', fontSize: 40),
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
                      labelText: 'Confirm Password',
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
                        print('Sign up');
                      },
                      child: ScText('Sign up'),
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
