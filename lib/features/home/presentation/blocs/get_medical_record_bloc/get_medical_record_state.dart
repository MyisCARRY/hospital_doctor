part of 'get_medical_record_bloc.dart';

@freezed
class GetMedicalRecordState with _$GetMedicalRecordState {
  factory GetMedicalRecordState.loading() = _Loading;

  factory GetMedicalRecordState.error(Failure failure) = _Error;

  factory GetMedicalRecordState.data(MedicalRecord medicalRecord) = _Data;
}
