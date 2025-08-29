import 'package:flutter_test/flutter_test.dart';
import 'package:skill_core/config/utils.dart';

void main() {
  group('Test validating', () {
    test('Test validate', () {
      final String correctString = 'test1';
      final String incorrectString = 'ab1';

      /// 4+ chars and one num
      final regExp = RegExp(r'^(?=.*\d).{4,}$');

      bool result1 = validate(correctString, regExp);
      bool result2 = validate(incorrectString, regExp);

      expect(result1, true);
      expect(result2, false);
    });
    test('Test validateEmail', () {
      final String correctEmail = 'test1234@gmail.com';
      final String incorrectEmail = 'test1234gmail.com';

      String? result1 = validateEmail(correctEmail);
      String? result2 = validateEmail(incorrectEmail);

      expect(result1, isNull);
      expect(result2, isA<String>());
    });
    test('Test validatePassword', () {
      final String correctPassword = 'test1234';
      final String incorrectPassword = 'test123';

      String? result1 = validatePassword(correctPassword);
      String? result2 = validatePassword(incorrectPassword);

      expect(result1, isNull);
      expect(result2, isA<String>());
    });
  });
}
