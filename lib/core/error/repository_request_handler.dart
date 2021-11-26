import 'package:dartz/dartz.dart';
import 'package:fimber/fimber.dart';
import 'package:hospital_doctor/core/error/exceptions.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/helper/type_aliases.dart';

class RepositoryRequestHandler<T> {
  FutureFailable<T> call({
    required Failure defaultFailure,
    required Future<T> Function() request,
  }) async {
    try {
      return Right(await request());
    } catch (error) {
      Fimber.e(error.toString());
      final failure = errorHandler(error, defaultFailure);

      return Left(failure);
    }
  }
}
