import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [errorMessage];

  String get _errorMessage;

  int get _errorCode;

  String get errorMessage => '$_errorMessage \nec_$_errorCode';
}
