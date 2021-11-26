import 'package:equatable/equatable.dart';
import 'package:hospital_doctor/generated/l10n.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [errorMessage];

  String get _errorMessage;

  int get _errorCode;

  String get errorMessage => '$_errorMessage \nec_$_errorCode';
}

abstract class AuthFailure extends Failure {}

class LoginFailure extends AuthFailure {
  @override
  int get _errorCode => 100;

  @override
  String get _errorMessage => S.current.loginFailure;
}

class RegisterFailure extends AuthFailure {
  @override
  int get _errorCode => 101;

  @override
  String get _errorMessage => S.current.registerFailure;
}
