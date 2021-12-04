import 'package:dartz/dartz.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record.dart';
import 'package:hospital_doctor/features/home/domain/repositories/home_repository.dart';

class GetMedicalRecordUsecase extends Usecase<MedicalRecord, int> {
  GetMedicalRecordUsecase({
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Future<Either<Failure, MedicalRecord>> call(int param) {
    return repository.getMedicalRecord(param);
  }
}
