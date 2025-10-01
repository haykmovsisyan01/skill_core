import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_core/data/sources/local/shared_preferences.dart';
import 'package:skill_core/firebase_options.dart';
import 'package:skill_core/presentation/sc_app.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await initializeSharedPreferences();
      runApp(ProviderScope(child: SCApp()));
    },
    (error, stack) {
      /// report to firebase
      log(error.toString(), stackTrace: stack);
    },
  );
}
