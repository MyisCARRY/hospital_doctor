import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';

class PatientListTile extends StatelessWidget {
  const PatientListTile({
    required this.patient,
    Key? key,
  }) : super(key: key);

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${patient.firstName} ${patient.lastName}', style: roboto.s18.w500.blackColor),
        const SizedBox(height: 2.0),
        Text(patient.login, style: roboto.s16.w400.blackColor),
      ],
    );
  }
}
