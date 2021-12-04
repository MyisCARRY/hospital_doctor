import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_doctor/features/home/domain/entities/new_patient.dart';

part 'new_patient_form_event.dart';

part 'new_patient_form_state.dart';

part 'new_patient_form_bloc.freezed.dart';

class NewPatientFormBloc extends Bloc<NewPatientFormEvent, NewPatientFormState> {
  NewPatientFormBloc() : super(NewPatientFormState.data(NewPatient.empty(), false)) {
    _patient = NewPatient.empty();
  }

  late NewPatient _patient;

  @override
  Stream<NewPatientFormState> mapEventToState(NewPatientFormEvent event) async* {
    yield* event.map(
      changeFirstName: _changeFirstName,
      changeLastName: _changeLastName,
      changeEmail: _changeEmail,
    );
  }

  Stream<NewPatientFormState> _changeFirstName(_ChangeFirstName event) async* {
    _patient = _patient.copyWith(firstName: event.firstName);
    yield _data;
  }

  Stream<NewPatientFormState> _changeLastName(_ChangeLastName event) async* {
    _patient = _patient.copyWith(lastName: event.lastName);
    yield _data;
  }

  Stream<NewPatientFormState> _changeEmail(_ChangeEmail event) async* {
    _patient = _patient.copyWith(email: event.email);
    yield _data;
  }

  NewPatientFormState get _data => NewPatientFormState.data(_patient, _isValid);

  bool get _isValid => _patient.firstName.isNotEmpty && _patient.lastName.isNotEmpty && _patient.email.isNotEmpty;
}
