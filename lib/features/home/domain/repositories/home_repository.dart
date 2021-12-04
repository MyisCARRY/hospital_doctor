import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/features/home/domain/entities/new_patient.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';

abstract class HomeRepository {
  FutureFailable<List<Patient>> getPatientsList();

  FutureFailable<bool> createNewPatient(NewPatient patient);
}
