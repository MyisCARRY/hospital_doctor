import 'package:dartz/dartz.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record_param.dart';
import 'package:hospital_doctor/features/home/domain/repositories/home_repository.dart';

class UpdateMedicalRecordUsecase extends Usecase<MedicalRecord, MedicalRecordParam> {
  UpdateMedicalRecordUsecase({
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Future<Either<Failure, MedicalRecord>> call(MedicalRecordParam param) {
    return repository.updateMedicalRecord(param);
  }
}
