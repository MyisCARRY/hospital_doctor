part of 'new_patient_form_bloc.dart';

@freezed
class NewPatientFormEvent with _$NewPatientFormEvent {
  factory NewPatientFormEvent.changeFirstName(String firstName) = _ChangeFirstName;

  factory NewPatientFormEvent.changeLastName(String lastName) = _ChangeLastName;

  factory NewPatientFormEvent.changeEmail(String email) = _ChangeEmail;
}
