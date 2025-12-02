// logos
import 'package:flutter/material.dart';
import 'package:skill_core/config/strings.dart';

const String appLogoLightPath = 'assets/logos/logo_light.png';
const String appLogoDarkPath = 'assets/logos/logo_dark.png';

// RegExp
final emailRegexp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

// password.length > 8
final passRegexp = RegExp(r'^.{8,}$');

// Name and Surname (> 2)
final nameSurNameRegexp = RegExp(r'^[A-Za-z]{2,}$');

// Api
const String globalCollection = 'global';
const String guidesCollection = 'guides';
const String testsCollection = 'tests';
const String usersCollection = 'users';

// Fonts
const robotoFont = 'Roboto';

// Images
const String welcomeImage = 'assets/images/welcome_image.png';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF3379C8),
    onPrimary: Colors.white,

    secondary: Color(0xFF29B6F6),
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black87,

    error: Color(0xFFD32F2F),
    onError: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1565C0),
    foregroundColor: Colors.white,
    elevation: 2,
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF1565C0),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  iconTheme: IconThemeData(color: Color(0xFF1565C0)),
);
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF90CAF9),
    onPrimary: Colors.black,

    secondary: Color(0xFF29B6F6),
    onSecondary: Colors.black,

    surface: Color(0xFF1E1E1E),
    onSurface: Colors.white,

    error: Color(0xFFEF5350),
    onError: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    foregroundColor: Colors.white,
    elevation: 1,
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF90CAF9),
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF29B6F6),
    foregroundColor: Colors.black,
  ),
  iconTheme: IconThemeData(color: Color(0xFF90CAF9)),
);

Map<String, ThemeData> themes = {light: lightTheme, dark: darkTheme};
