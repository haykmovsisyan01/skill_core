import 'package:skill_core/config/constants.dart';

bool validate(String data, RegExp regexp) {
  if (data.isEmpty) {
    return false;
  } else if (!regexp.hasMatch(data)) {
    return false;
  }

  return true;
}

String? validateEmail(String? email) {
  email = email?.trim();
  if (email == null || email.isEmpty) {
    return 'Email is empty!';
  }

  if (!validate(email, emailRegexp)) {
    return 'Please type valid email';
  }

  /// return null if email is correct
  return null;
}

String? validatePassword(String? password) {
  password = password?.trim();
  if (password == null || password.isEmpty) {
    return 'Password is empty!';
  }

  if (!validate(password, passRegexp)) {
    return 'Password length must be more or equal 8 symbols';
  }

  /// return null if password is correct
  return null;
}
