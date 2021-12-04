import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_patient.freezed.dart';

part 'new_patient.g.dart';

@freezed
class NewPatient with _$NewPatient {
  factory NewPatient({
    required String email,
    required String firstName,
    required String lastName,
  }) = _NewPatient;

  factory NewPatient.empty() {
    return NewPatient(
      email: '',
      firstName: '',
      lastName: '',
    );
  }

  factory NewPatient.fromJson(Map<String, dynamic> json) => _$NewPatientFromJson(json);
}
