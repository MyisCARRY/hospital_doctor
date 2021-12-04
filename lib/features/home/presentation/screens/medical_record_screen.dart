import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_doctor/core/navigator/navigator.dart';
import 'package:hospital_doctor/core/presentation/appbars/title_appbar.dart';
import 'package:hospital_doctor/core/presentation/widgets/custom_error_widget.dart';
import 'package:hospital_doctor/core/presentation/widgets/custom_loading_widget.dart';
import 'package:hospital_doctor/core/style/colors.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/get_medical_record_bloc/get_medical_record_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/widgets/medical_record_content.dart';
import 'package:hospital_doctor/injection_container.dart';

class MedicalRecordScreen extends StatefulWidget with NavigatedScreen {
  const MedicalRecordScreen({
    required this.patient,
    Key? key,
  }) : super(key: key);

  final Patient patient;

  @override
  _MedicalRecordScreenState createState() => _MedicalRecordScreenState();

  @override
  String get routeName => 'medical_record_screen';
}

class _MedicalRecordScreenState extends State<MedicalRecordScreen> {
  late final GetMedicalRecordBloc _getMedicalRecordBloc;

  @override
  void initState() {
    _getMedicalRecordBloc = sl();
    _getMedicalRecordBloc.add(GetMedicalRecordEvent.load(widget.patient.id));

    super.initState();
  }

  @override
  void dispose() {
    _getMedicalRecordBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: TitleAppBar(context, title: '${widget.patient.firstName} ${widget.patient.lastName}'),
      body: SafeArea(
        child: BlocBuilder(
          bloc: _getMedicalRecordBloc,
          builder: (BuildContext context, GetMedicalRecordState state) {
            return state.map(
              loading: (state) => const CustomLoadingWidget(color: CustomColors.blue),
              error: (state) => CustomErrorWidget(
                onRefresh: () => _getMedicalRecordBloc.add(GetMedicalRecordEvent.load(widget.patient.id)),
              ),
              data: (state) => MedicalRecordContent(
                medicalRecord: state.medicalRecord,
                patientId: widget.patient.id,
              ),
            );
          },
        ),
      ),
    );
  }
}
