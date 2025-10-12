import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences _preferences;

Future<void> initializeSharedPreferences() async {
  _preferences = await SharedPreferences.getInstance();
}

SharedPreferences get preferences => _preferences;
