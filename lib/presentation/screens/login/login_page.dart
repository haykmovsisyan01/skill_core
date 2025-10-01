import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/config/colors.dart';
import 'package:skill_core/presentation/providers/auth_provider.dart';
import 'package:skill_core/presentation/providers/bloc/init/init_bloc.dart';
import 'package:skill_core/presentation/routes.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';
import 'package:skill_core/presentation/widgets/sc_text_field.dart';

import '../../../config/strings.dart';
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
  TapGestureRecognizer recognizer = TapGestureRecognizer();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      recognizer.onTap = () {
        context.push(passwordResetRoute);
      };
    });
    super.initState();
  }

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AuthState>>(authNotifierProvider, (prev, next) {
      next.when(
        data: (state) {
          if (state.isPasswordResetMailSent) {
            context.go(welcomeRoute);
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            context.read<InitBloc>().add(InitCheckEvent());
          }
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
    return BlocListener<InitBloc, InitState>(
      listener: (context, state) {
        if (state is InitCheckedState) {
          if (state.isUserOptionsDefined == false) {
            context.go(userOptionsAdmit);
          } else {
            context.go(homeRoute);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              ScText(login, fontSize: 30),
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
                },
                child: ScText(login),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Have password forgotten?',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Click here',
                      style: TextStyle(color: primaryColor),
                      recognizer: recognizer,
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
}
