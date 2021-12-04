import 'package:flutter/material.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';
import 'package:hospital_doctor/features/home/presentation/widgets/patient_list_tile.dart';

class PatientsList extends StatelessWidget {
  const PatientsList({
    required this.patients,
    Key? key,
  }) : super(key: key);

  final List<Patient> patients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: patients.length,
      itemBuilder: (BuildContext context, int i) => PatientListTile(patient: patients[i]),
    );
  }
}
