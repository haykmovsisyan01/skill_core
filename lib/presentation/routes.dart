import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/presentation/screens/app_manager.dart';
import 'package:skill_core/presentation/screens/guides/guide_page.dart';
import 'package:skill_core/presentation/screens/guides/guides_page.dart';
import 'package:skill_core/presentation/screens/home/home_page.dart';
import 'package:skill_core/presentation/screens/login/login_page.dart';
import 'package:skill_core/presentation/screens/login/password_reset_page.dart';
import 'package:skill_core/presentation/screens/settings/settings_page.dart';
import 'package:skill_core/presentation/screens/sign_up/sign_up_page.dart';
import 'package:skill_core/presentation/screens/tests/test_page.dart';
import 'package:skill_core/presentation/screens/tests/tests_page.dart';
import 'package:skill_core/presentation/screens/welcome/welcome_page.dart';

/// Routes
const String initialRoute = '/';
const String welcomeRoute = '/welcome';
const String signUpRoute = '/sign_up';
const String loginRoute = '/login';
const String passwordResetRoute = '/pass_reset';
const String homeRoute = '/home';
const String settingsRoute = '/settings';
const String guidesRoute = '/guides';
const String guideRoute = '/guide';

const String testsRoute = '/tests';
const String testRoute = '/test';
const String testResultRoute = '/test_result';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();
GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: initialRoute,
  routes: [
    GoRoute(
      path: initialRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: AppManager());
      },
    ),
    GoRoute(
      path: welcomeRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: WelcomePage());
      },
    ),
    GoRoute(
      path: signUpRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: SignUpPage());
      },
    ),
    GoRoute(
      path: loginRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: LoginPage());
      },
    ),
    GoRoute(
      path: passwordResetRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: PasswordResetPage());
      },
    ),
    GoRoute(
      path: homeRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: HomePage());
      },
    ),
    GoRoute(
      path: settingsRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: SettingsPage());
      },
    ),
    GoRoute(
      path: guidesRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: GuidesPage());
      },
    ),
    GoRoute(
      path: guideRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: GuidePage(), arguments: state.extra);
      },
    ),
    GoRoute(
      path: testsRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: TestsPage());
      },
    ),
    GoRoute(
      path: testRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: TestPage(), arguments: state.extra);
      },
    ),
  ],
);

get router => _router;
