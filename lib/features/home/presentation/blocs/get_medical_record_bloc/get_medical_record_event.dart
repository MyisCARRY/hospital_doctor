part of 'get_medical_record_bloc.dart';

@freezed
class GetMedicalRecordEvent with _$GetMedicalRecordEvent {
  factory GetMedicalRecordEvent.load(int patientId) = _Load;
}
