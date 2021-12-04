import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/navigator/navigator.dart';
import 'package:hospital_doctor/core/presentation/appbars/title_appbar.dart';
import 'package:hospital_doctor/core/style/colors.dart';

class NewPatientScreen extends StatefulWidget with NavigatedScreen {
  const NewPatientScreen({Key? key}) : super(key: key);

  @override
  _NewPatientScreenState createState() => _NewPatientScreenState();

  @override
  String get routeName => 'new_patient_screen';
}

class _NewPatientScreenState extends State<NewPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: TitleAppBar(context, title: 'New patient'),
    );
  }
}
