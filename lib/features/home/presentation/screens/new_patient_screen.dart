import 'package:any_animated_button/any_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/helper/validators.dart';
import 'package:hospital_doctor/core/navigator/navigator.dart';
import 'package:hospital_doctor/core/presentation/appbars/title_appbar.dart';
import 'package:hospital_doctor/core/presentation/buttons/filled_button.dart';
import 'package:hospital_doctor/core/presentation/widgets/notifications.dart';
import 'package:hospital_doctor/core/presentation/widgets/scroll_extend_widget.dart';
import 'package:hospital_doctor/core/presentation/widgets/textfields/basic_outlined_textfield.dart';
import 'package:hospital_doctor/core/style/colors.dart';
import 'package:hospital_doctor/core/style/paddings.dart';
import 'package:hospital_doctor/features/home/domain/entities/new_patient.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/create_new_patient_bloc/create_new_patient_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/new_patient_form_bloc/new_patient_form_bloc.dart';
import 'package:hospital_doctor/injection_container.dart';

class NewPatientScreen extends StatefulWidget with NavigatedScreen {
  const NewPatientScreen({
    required this.refresh,
    Key? key,
  }) : super(key: key);

  final VoidCallback refresh;

  @override
  _NewPatientScreenState createState() => _NewPatientScreenState();

  @override
  String get routeName => 'new_patient_screen';
}

class _NewPatientScreenState extends State<NewPatientScreen> {
  late final NewPatientFormBloc _newPatientFormBloc;
  late final CreateNewPatientBloc _createNewPatientBloc;

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;

  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _newPatientFormBloc = sl();
    _createNewPatientBloc = sl();

    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();

    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _newPatientFormBloc.close();
    _createNewPatientBloc.close();

    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        AnyAnimatedButtonBlocListener<NewPatient, bool, Failure>(
          bloc: _createNewPatientBloc,
          onErrorStart: (failure) => Notifications.error(failure: failure),
          onSuccessEnd: (data) {
            widget.refresh();
            Navigator.of(context).pop();
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: CustomColors.white,
        appBar: TitleAppBar(context, title: 'New patient'),
        body: SafeArea(
          child: ScrollExtendedWidget(
            child: Padding(
              padding: Paddings.horizontal24,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 40.0),
                    BasicOutlinedTextfield(
                      controller: _firstNameController,
                      hint: 'First name',
                      validator: FirstNameValidator().errorMessage,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => _newPatientFormBloc.add(NewPatientFormEvent.changeFirstName(value)),
                    ),
                    const SizedBox(height: 16.0),
                    BasicOutlinedTextfield(
                      controller: _lastNameController,
                      hint: 'Last name',
                      validator: LastNameValidator().errorMessage,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => _newPatientFormBloc.add(NewPatientFormEvent.changeLastName(value)),
                    ),
                    const SizedBox(height: 16.0),
                    BasicOutlinedTextfield(
                      controller: _emailController,
                      hint: 'Email',
                      validator: EmailValidator.errorMessage,
                      onChanged: (value) => _newPatientFormBloc.add(NewPatientFormEvent.changeEmail(value)),
                    ),
                    const Expanded(child: SizedBox(height: 16.0)),
                    BlocBuilder(
                      bloc: _newPatientFormBloc,
                      builder: (BuildContext context, NewPatientFormState state) {
                        return FilledButton(
                          text: 'Create',
                          bloc: _createNewPatientBloc,
                          enabled: state.valid,
                          onTap: () => _onCreateTap(state.patient),
                        );
                      },
                    ),
                    const SizedBox(height: 22.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onCreateTap(NewPatient patient) {
    if (_formKey.currentState?.validate() ?? false) {
      _createNewPatientBloc.add(TriggerAnyAnimatedButtonEvent(patient));
    }
  }
}
