part of 'patients_list_bloc.dart';

@freezed
class PatientsListEvent with _$PatientsListEvent {
  factory PatientsListEvent.load() = _Load;
}
