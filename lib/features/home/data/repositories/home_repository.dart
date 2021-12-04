import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/error/repository_request_handler.dart';
import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/features/home/data/datasources/home_datasource.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record_param.dart';
import 'package:hospital_doctor/features/home/domain/entities/new_patient.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';
import 'package:hospital_doctor/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({
    required this.datasource,
  });

  final HomeDatasource datasource;

  @override
  FutureFailable<List<Patient>> getPatientsList() {
    return RepositoryRequestHandler<List<Patient>>()(
      request: datasource.getPatientsList,
      defaultFailure: GetPatientsFailure(),
    );
  }

  @override
  FutureFailable<bool> createNewPatient(NewPatient patient) {
    return RepositoryRequestHandler<bool>()(
      request: () => datasource.createNewPatient(patient),
      defaultFailure: CreateNewPatientFailure(),
    );
  }

  @override
  FutureFailable<MedicalRecord> getMedicalRecord(int patientId) {
    return RepositoryRequestHandler<MedicalRecord>()(
      request: () => datasource.getMedicalRecord(patientId),
      defaultFailure: GetMedicalRecordFailure(),
    );
  }

  @override
  FutureFailable<MedicalRecord> updateMedicalRecord(MedicalRecordParam param) {
    return RepositoryRequestHandler<MedicalRecord>()(
      request: () => datasource.updateMedicalRecord(param),
      defaultFailure: UpdateMedicalRecordFailure(),
    );
  }
}
