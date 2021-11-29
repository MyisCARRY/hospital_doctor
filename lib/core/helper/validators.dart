import 'package:hospital_doctor/core/helper/consts.dart';

abstract class LoginValidator {
  static String? errorMessage(String? value) {
    if (value?.isEmpty ?? true) {
      return 'To pole jest wymagane';
    }
    if (value!.length < Consts.loginMinLength) {
      return 'To pole wymaga minimalnie ${Consts.loginMinLength} znaków';
    }
    if (Consts.loginMaxLength < value.length) {
      return 'To pole wymaga maksymalnie ${Consts.loginMaxLength} znaków';
    }
    return null;
  }
}

abstract class PasswordValidator {
  static String? errorMessage(String? value) {
    if (value?.isEmpty ?? true) {
      return 'To pole jest wymagane';
    }
    if (value!.length < Consts.passwordMinLength) {
      return 'To pole wymaga minimalnie ${Consts.passwordMinLength} znaków';
    }
    if (Consts.passwordMaxLength < value.length) {
      return 'To pole wymaga maksymalnie ${Consts.passwordMaxLength} znaków';
    }
    return null;
  }
}
