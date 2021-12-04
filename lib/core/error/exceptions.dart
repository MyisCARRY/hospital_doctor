import 'package:hospital_doctor/core/error/failures.dart';

Failure errorHandler(Object error, Failure defaultFailure) {
  if (error is GetTokenException) {
    return HiveGetFieldFailure();
  }
  return defaultFailure;
}

class GetTokenException implements Exception {}
