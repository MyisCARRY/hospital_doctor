import 'package:dio/dio.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record_param.dart';
import 'package:hospital_doctor/features/home/domain/entities/new_patient.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';

abstract class HomeDatasource {
  Future<List<Patient>> getPatientsList();

  Future<bool> createNewPatient(NewPatient patient);

  Future<MedicalRecord> getMedicalRecord(int patientId);

  Future<MedicalRecord> updateMedicalRecord(MedicalRecordParam param);
}

class HomeDatasourceImpl extends HomeDatasource {
  HomeDatasourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<Patient>> getPatientsList() async {
    final response = await dio.get('/doctor/myPatients');
    final result = (response.data as List).map((json) => Patient.fromJson(json)).toList();
    return result;
  }

  @override
  Future<bool> createNewPatient(NewPatient patient) async {
    await dio.post('/doctor/patient', data: patient.toJson());
    return true;
  }

  @override
  Future<MedicalRecord> getMedicalRecord(int patientId) async {
    final response = await dio.get('/medical/doctor/$patientId');
    final result = MedicalRecord.fromJson(response.data);
    return result;
  }

  @override
  Future<MedicalRecord> updateMedicalRecord(MedicalRecordParam param) async {
    final response = await dio.put(
      '/medical/doctor/${param.patientId}',
      data: param.medicalRecord.toJson(),
    );
    final result = MedicalRecord.fromJson(response.data);
    return result;
  }
}
