import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/config/colors.dart';
import 'package:skill_core/presentation/routes.dart';
import 'package:skill_core/presentation/widgets/sc_button.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';

import '../../../config/constants.dart';
import '../../../config/strings.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TapGestureRecognizer recognizer = TapGestureRecognizer();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      recognizer.onTap = () {
        context.push(loginRoute);
      };
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          child: Column(
            children: [
              Image.asset(
                appLogoLightPath,
                width: MediaQuery.sizeOf(context).width / 3,
                height: MediaQuery.sizeOf(context).width / 3,
              ),
              ScText('Welcome to $appName!', fontSize: 30),
              SizedBox(height: MediaQuery.sizeOf(context).height / 25),
              ScText(skillCoreSlogan, fontSize: 15, color: Colors.black),
              Expanded(flex: 3, child: Placeholder()),
              ScButton(
                onPressed: () {
                  context.push(signUpRoute);
                },
                child: ScText(getStarted, color: Colors.white, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyHaveAcc,
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: login,
                        style: TextStyle(color: primaryColor),
                        recognizer: recognizer,
                      ),
                    ],
                  ),
                ),
              ),

              /// Text
              Expanded(flex: 1, child: Placeholder()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    recognizer.dispose();
    super.dispose();
  }
}
