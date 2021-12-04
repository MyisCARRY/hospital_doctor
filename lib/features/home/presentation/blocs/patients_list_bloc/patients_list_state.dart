part of 'patients_list_bloc.dart';

@freezed
class PatientsListState with _$PatientsListState {
  factory PatientsListState.loading() = _Loading;

  factory PatientsListState.error(Failure failure) = _Error;

  factory PatientsListState.empty() = _Empty;

  factory PatientsListState.data(List<Patient> patients) = _Data;
}
