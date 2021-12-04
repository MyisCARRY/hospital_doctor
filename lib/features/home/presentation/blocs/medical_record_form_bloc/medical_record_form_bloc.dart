import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record.dart';

part 'medical_record_form_event.dart';

part 'medical_record_form_state.dart';

part 'medical_record_form_bloc.freezed.dart';

class MedicalRecordFormBloc extends Bloc<MedicalRecordFormEvent, MedicalRecordFormState> {
  MedicalRecordFormBloc({
    required this.initialMedicalRecord,
  }) : super(MedicalRecordFormState.data(initialMedicalRecord, false)) {
    _medicalRecord = initialMedicalRecord.copyWith();
  }

  final MedicalRecord initialMedicalRecord;
  late MedicalRecord _medicalRecord;

  @override
  Stream<MedicalRecordFormState> mapEventToState(MedicalRecordFormEvent event) async* {
    yield* event.map(
      changePregnancies: _changePregnancies,
      changeGlucose: _changeGlucose,
      changeBloodPressure: _changeBloodPressure,
      changeSkinThickness: _changeSkinThickness,
      changeInsulin: _changeInsulin,
      changeBmi: _changeBmi,
      changeDiabetes: _changeDiabetes,
      changeAge: _changeAge,
    );
  }

  Stream<MedicalRecordFormState> _changePregnancies(_ChangePregnancies event) async* {
    _medicalRecord = _medicalRecord.copyWith(pregnancies: event.pregnancies);
    yield _data;
  }

  Stream<MedicalRecordFormState> _changeGlucose(_ChangeGlucose event) async* {
    _medicalRecord = _medicalRecord.copyWith(glucose: event.glucose);
    yield _data;
  }

  Stream<MedicalRecordFormState> _changeBloodPressure(_ChangeBloodPressure event) async* {
    _medicalRecord = _medicalRecord.copyWith(bloodPressure: event.bloodPressure);
    yield _data;
  }

  Stream<MedicalRecordFormState> _changeSkinThickness(_ChangeSkinThickness event) async* {
    _medicalRecord = _medicalRecord.copyWith(skinThickness: event.skinThickness);
    yield _data;
  }

  Stream<MedicalRecordFormState> _changeInsulin(_ChangeInsulin event) async* {
    _medicalRecord = _medicalRecord.copyWith(insulin: event.insulin);
    yield _data;
  }

  Stream<MedicalRecordFormState> _changeBmi(_ChangeBmi event) async* {
    _medicalRecord = _medicalRecord.copyWith(bmi: event.bmi);
    yield _data;
  }

  Stream<MedicalRecordFormState> _changeDiabetes(_ChangeDiabetes event) async* {
    _medicalRecord = _medicalRecord.copyWith(diabetes: event.diabetes);
    yield _data;
  }

  Stream<MedicalRecordFormState> _changeAge(_ChangeAge event) async* {
    _medicalRecord = _medicalRecord.copyWith(age: event.age);
    yield _data;
  }

  MedicalRecordFormState get _data => MedicalRecordFormState.data(_medicalRecord, _isValid);

  bool get _isValid => initialMedicalRecord != _medicalRecord;
}
