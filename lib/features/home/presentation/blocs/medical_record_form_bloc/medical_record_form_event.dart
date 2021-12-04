part of 'medical_record_form_bloc.dart';

@freezed
class MedicalRecordFormEvent with _$MedicalRecordFormEvent {
  factory MedicalRecordFormEvent.changePregnancies(int pregnancies) = _ChangePregnancies;

  factory MedicalRecordFormEvent.changeGlucose(int glucose) = _ChangeGlucose;

  factory MedicalRecordFormEvent.changeBloodPressure(int bloodPressure) = _ChangeBloodPressure;

  factory MedicalRecordFormEvent.changeSkinThickness(int skinThickness) = _ChangeSkinThickness;

  factory MedicalRecordFormEvent.changeInsulin(int insulin) = _ChangeInsulin;

  factory MedicalRecordFormEvent.changeBmi(double bmi) = _ChangeBmi;

  factory MedicalRecordFormEvent.changeDiabetes(double diabetes) = _ChangeDiabetes;

  factory MedicalRecordFormEvent.changeAge(int age) = _ChangeAge;
}
