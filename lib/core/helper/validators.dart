import 'package:hospital_doctor/core/helper/consts.dart';

abstract class LengthValidator {
  int get min;

  int get max;

  String? errorMessage(String? value) {
    if (value?.isEmpty ?? true) {
      return 'To pole jest wymagane';
    }
    if (value!.length < min) {
      return 'To pole wymaga minimalnie $min znaków';
    }
    if (max < value.length) {
      return 'To pole wymaga maksymalnie $max znaków';
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
