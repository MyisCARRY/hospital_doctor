part of 'new_patient_form_bloc.dart';

@freezed
class NewPatientFormState with _$NewPatientFormState {
  factory NewPatientFormState.data(NewPatient patient, bool valid) = _Data;
}
