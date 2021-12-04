import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/helper/widget_ext.dart';
import 'package:hospital_doctor/core/style/paddings.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';

class PatientListTile extends StatelessWidget {
  const PatientListTile({
    required this.patient,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Patient patient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: Paddings.horizontal24,
        child: Padding(
          padding: Paddings.vertical8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${patient.firstName} ${patient.lastName}', style: roboto.s18.w700.blackColor),
              const SizedBox(height: 2.0),
              Text(patient.login, style: roboto.s16.w400.blackColor),
            ],
          ),
        ),
      ),
    ).noSplash();
  }
}
