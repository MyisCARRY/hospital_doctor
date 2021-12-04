import 'package:dartz/dartz.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';
import 'package:hospital_doctor/features/home/domain/repositories/home_repository.dart';

class GetPatientsUsecase extends Usecase<List<Patient>, NoParams> {
  GetPatientsUsecase({
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Future<Either<Failure, List<Patient>>> call(NoParams param) {
    return repository.getPatientsList();
  }
}
