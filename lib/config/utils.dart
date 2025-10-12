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
  if (email == null || email.isEmpty) {
    return 'Email is empty!';
  }
  email = email.trim();

  if (!validate(email, emailRegexp)) {
    return 'Please type valid email';
  }

  /// return null if email is correct
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password is empty!';
  }

  password = password.trim();

  if (!validate(password, passRegexp)) {
    return 'Password length must be more or equal 8 symbols';
  }

  /// return null if password is correct
  return null;
}

String? validateNameAndSurname(String? text) {
  if (text == null || text.isEmpty) {
    return 'Please fill field!';
  }

  text = text.trim();

  if (!validate(text, nameSurNameRegexp)) {
    return 'Must be more than 2 symbols';
  }

  return null;
}
