import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUseCase {
  final SharedPreferences preferences;

  SharedPrefUseCase({required this.preferences});

  Future<bool> put(String key, dynamic value) async {
    switch (value) {
      case int _:
        return await preferences.setInt(key, value);

      case bool _:
        return await preferences.setBool(key, value);

      case String _:
        print('IN USECASE');
        return await preferences.setString(key, value);

      case double _:
        return await preferences.setDouble(key, value);

      case List<String> _:
        return await preferences.setStringList(key, value);

      default:
        return false;
    }
  }

  Object? get(String key) {
    return preferences.get(key);
  }

  Future<bool> remove(String key) async {
    return await preferences.remove(key);
  }
}
