import 'package:hospital_doctor/features/home/domain/entities/medical_record.dart';

class MedicalRecordParam {
  MedicalRecordParam({
    required this.patientId,
    required this.medicalRecord,
  });

  final int patientId;
  final MedicalRecord medicalRecord;
}
