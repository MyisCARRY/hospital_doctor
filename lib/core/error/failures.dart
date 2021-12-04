import 'package:equatable/equatable.dart';
import 'package:hospital_doctor/generated/l10n.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [errorMessage];

  String get _errorMessage;

  int get _errorCode;

  String get errorMessage => '$_errorMessage \nec_$_errorCode';
}

class FailureTest extends Failure {
  @override
  int get _errorCode => -1;

  @override
  String get _errorMessage => '';
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

abstract class HiveFailure extends Failure {}

class HiveGetFieldFailure extends Failure {
  @override
  String get _errorMessage => S.current.hiveDefaultFailure;

  @override
  int get _errorCode => 200;
}

class HiveSaveFieldFailure extends Failure {
  @override
  String get _errorMessage => S.current.hiveDefaultFailure;

  @override
  int get _errorCode => 201;
}

class HiveDeleteFieldFailure extends Failure {
  @override
  String get _errorMessage => S.current.hiveDefaultFailure;

  @override
  int get _errorCode => 202;
}

abstract class HomeFailure extends Failure {}

class GetPatientsFailure extends HomeFailure {
  @override
  int get _errorCode => 300;

  @override
  String get _errorMessage => S.current.getPatientsFailure;
}
