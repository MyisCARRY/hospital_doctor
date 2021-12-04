part of 'medical_record_form_bloc.dart';

@freezed
class MedicalRecordFormState with _$MedicalRecordFormState {
  factory MedicalRecordFormState.data(MedicalRecord medicalRecord, bool valid) = _Data;
}
