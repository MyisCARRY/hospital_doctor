import 'package:hospital_doctor/core/helper/consts.dart';
import 'package:hospital_doctor/core/helper/regexes.dart';

abstract class LengthValidator {
  int get min;

  int get max;

  String? errorMessage(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is necessary';
    }
    if (value!.length < min) {
      return 'This field needs min of $min characters';
    }
    if (max < value.length) {
      return 'This field needs max of $max characters';
    }
    return null;
  }
}

class LoginValidator extends LengthValidator {
  @override
  int get min => Consts.loginMinLength;

  @override
  int get max => Consts.loginMaxLength;
}

class PasswordValidator extends LengthValidator {
  @override
  int get min => Consts.passwordMinLength;

  @override
  int get max => Consts.passwordMaxLength;
}

class FirstNameValidator extends LengthValidator {
  @override
  int get min => Consts.firstNameMinLength;

  @override
  int get max => Consts.firstNameMaxLength;
}

class LastNameValidator extends LengthValidator {
  @override
  int get min => Consts.lastNameMinLength;

  @override
  int get max => Consts.lastNameMaxLength;
}

abstract class EmailValidator {
  static String? errorMessage(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is necessary';
    }
    if (!Regexes.isEmail.hasMatch(value!)) {
      return 'Incorrect email';
    }
    return null;
  }
}
