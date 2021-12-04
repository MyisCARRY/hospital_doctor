import 'package:dartz/dartz.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/home/domain/entities/new_patient.dart';
import 'package:hospital_doctor/features/home/domain/repositories/home_repository.dart';

class CreateNewPatientUsecase extends Usecase<bool, NewPatient> {
  CreateNewPatientUsecase({
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Future<Either<Failure, bool>> call(NewPatient param) {
    return repository.createNewPatient(param);
  }
}
