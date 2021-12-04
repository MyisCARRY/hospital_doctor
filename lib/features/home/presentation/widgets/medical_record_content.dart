import 'package:any_animated_button/any_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/helper/validators.dart';
import 'package:hospital_doctor/core/presentation/buttons/filled_button.dart';
import 'package:hospital_doctor/core/presentation/widgets/dialogs.dart';
import 'package:hospital_doctor/core/presentation/widgets/notifications.dart';
import 'package:hospital_doctor/core/presentation/widgets/scroll_extend_widget.dart';
import 'package:hospital_doctor/core/presentation/widgets/textfields/basic_outlined_textfield.dart';
import 'package:hospital_doctor/core/style/paddings.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record_param.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/medical_record_form_bloc/medical_record_form_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/update_medical_record_bloc/update_medical_record_bloc.dart';
import 'package:hospital_doctor/injection_container.dart';

class MedicalRecordContent extends StatefulWidget {
  const MedicalRecordContent({
    required this.medicalRecord,
    required this.patientId,
    Key? key,
  }) : super(key: key);

  final MedicalRecord medicalRecord;
  final int patientId;

  @override
  _MedicalRecordContentState createState() => _MedicalRecordContentState();
}

class _MedicalRecordContentState extends State<MedicalRecordContent> {
  late final TextEditingController _pregnanciesController;
  late final TextEditingController _glucoseController;
  late final TextEditingController _bloodPressureController;
  late final TextEditingController _skinThicknessController;
  late final TextEditingController _insulinController;
  late final TextEditingController _bmiController;
  late final TextEditingController _diabetesController;
  late final TextEditingController _ageController;

  late final MedicalRecordFormBloc _medicalRecordFormBloc;
  late final UpdateMedicalRecordBloc _updateMedicalRecordBloc;

  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _pregnanciesController = TextEditingController(text: widget.medicalRecord.pregnancies.toString());
    _glucoseController = TextEditingController(text: widget.medicalRecord.glucose.toString());
    _bloodPressureController = TextEditingController(text: widget.medicalRecord.bloodPressure.toString());
    _skinThicknessController = TextEditingController(text: widget.medicalRecord.skinThickness.toString());
    _insulinController = TextEditingController(text: widget.medicalRecord.insulin.toString());
    _bmiController = TextEditingController(text: widget.medicalRecord.bmi.toString());
    _diabetesController = TextEditingController(text: widget.medicalRecord.diabetes.toString());
    _ageController = TextEditingController(text: widget.medicalRecord.age.toString());

    _medicalRecordFormBloc = sl(param1: widget.medicalRecord);
    _updateMedicalRecordBloc = sl();

    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _pregnanciesController.dispose();
    _glucoseController.dispose();
    _bloodPressureController.dispose();
    _skinThicknessController.dispose();
    _insulinController.dispose();
    _bmiController.dispose();
    _diabetesController.dispose();
    _ageController.dispose();

    _medicalRecordFormBloc.close();
    _updateMedicalRecordBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        AnyAnimatedButtonBlocListener<MedicalRecordParam, MedicalRecord, Failure>(
          bloc: _updateMedicalRecordBloc,
          onErrorStart: (failure) => Notifications.error(failure: failure),
          onSuccessEnd: (data) {
            Dialogs.ok(
              context,
              text: 'Outcome: ${data.outcome}',
              onOk: () => Navigator.of(context).pop(),
            );
          },
        ),
      ],
      child: ScrollExtendedWidget(
        child: Padding(
          padding: Paddings.horizontal24,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40.0),
                BasicOutlinedTextfield(
                  controller: _pregnanciesController,
                  hint: 'Pregnancies number',
                  label: 'Pregnancies number',
                  validator: EmptyValidator.errorMessage,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) =>
                      _medicalRecordFormBloc.add(MedicalRecordFormEvent.changePregnancies(int.tryParse(value) ?? 0)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                BasicOutlinedTextfield(
                  controller: _glucoseController,
                  hint: 'Glucose',
                  label: 'Glucose',
                  validator: EmptyValidator.errorMessage,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) =>
                      _medicalRecordFormBloc.add(MedicalRecordFormEvent.changeGlucose(int.tryParse(value) ?? 0)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                BasicOutlinedTextfield(
                  controller: _bloodPressureController,
                  hint: 'Blood pressure',
                  label: 'Blood pressure',
                  validator: EmptyValidator.errorMessage,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) =>
                      _medicalRecordFormBloc.add(MedicalRecordFormEvent.changeBloodPressure(int.tryParse(value) ?? 0)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                BasicOutlinedTextfield(
                  controller: _skinThicknessController,
                  hint: 'Skin thickness',
                  label: 'Skin thickness',
                  validator: EmptyValidator.errorMessage,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) =>
                      _medicalRecordFormBloc.add(MedicalRecordFormEvent.changeSkinThickness(int.tryParse(value) ?? 0)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                BasicOutlinedTextfield(
                  controller: _insulinController,
                  hint: 'Insulin',
                  label: 'Insulin',
                  validator: EmptyValidator.errorMessage,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) =>
                      _medicalRecordFormBloc.add(MedicalRecordFormEvent.changeInsulin(int.tryParse(value) ?? 0)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                BasicOutlinedTextfield(
                  controller: _bmiController,
                  hint: 'BMI',
                  label: 'BMI',
                  validator: EmptyValidator.errorMessage,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) =>
                      _medicalRecordFormBloc.add(MedicalRecordFormEvent.changeBmi(double.tryParse(value) ?? 0)),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 16.0),
                BasicOutlinedTextfield(
                  controller: _diabetesController,
                  hint: 'Diabetes',
                  label: 'Diabetes',
                  validator: EmptyValidator.errorMessage,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) =>
                      _medicalRecordFormBloc.add(MedicalRecordFormEvent.changeDiabetes(double.tryParse(value) ?? 0)),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 16.0),
                BasicOutlinedTextfield(
                  controller: _ageController,
                  hint: 'Age',
                  label: 'Age',
                  // validator: FirstNameValidator().errorMessage,
                  onChanged: (value) =>
                      _medicalRecordFormBloc.add(MedicalRecordFormEvent.changeAge(int.tryParse(value) ?? 0)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                if (widget.medicalRecord.filled)
                  Row(
                    children: [
                      Text('Outcome: ', style: roboto.s18.blueColor),
                      Text((widget.medicalRecord.outcome ?? false).toString(), style: roboto.s18.w700.blueColor),
                    ],
                  ),
                const Expanded(child: SizedBox(height: 16.0)),
                BlocBuilder(
                  bloc: _medicalRecordFormBloc,
                  builder: (BuildContext context, MedicalRecordFormState state) {
                    return FilledButton(
                      text: 'Save',
                      bloc: _updateMedicalRecordBloc,
                      enabled: state.valid,
                      onTap: () => _onSaveTap(state.medicalRecord),
                    );
                  },
                ),
                const SizedBox(height: 22.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSaveTap(MedicalRecord medicalRecord) {
    if (_formKey.currentState?.validate() ?? false) {
      _updateMedicalRecordBloc.add(TriggerAnyAnimatedButtonEvent(MedicalRecordParam(
        patientId: widget.patientId,
        medicalRecord: medicalRecord,
      )));
    }
  }
}
