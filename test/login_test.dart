import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helloworld/authentification_pages/login.dart';
import 'package:helloworld/components/my_button.dart';
import 'package:helloworld/components/my_textfield.dart';
import 'package:helloworld/authentification_pages/login_or_register_page.dart';

void main() {
  // setUpAll(() async {
  //   await Firebase.initializeApp();
  // });

  // unit tests
  group('Login Unit Tests', () {
    test('Empty email returns error string', () {
      var result = EmailFieldValidator.validate('');
      expect(result, 'Email can\'t be empty');
    });

    test('Non-empty email returns null', () {
      var result = EmailFieldValidator.validate('test@test.com');
      expect(result, null);
    });

    test('Empty password returns error string', () {
      final result = PasswordFieldValidator.validate('');
      expect(result, null);
    });

    test('Non-empty password returns null', () {
      var result = PasswordFieldValidator.validate('testpassword');
      expect(result, null);
    });
  });
}

class PasswordFieldValidator {
  static validate(String s) {}
}

class EmailFieldValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email can\'t be empty';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}
