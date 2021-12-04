import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';
import 'package:hospital_doctor/features/home/domain/usecases/get_patients_usecase.dart';

part 'patients_list_event.dart';

part 'patients_list_state.dart';

part 'patients_list_bloc.freezed.dart';

class PatientsListBloc extends Bloc<PatientsListEvent, PatientsListState> {
  PatientsListBloc({
    required this.getPatientsUsecase,
  }) : super(PatientsListState.loading());

  final GetPatientsUsecase getPatientsUsecase;

  @override
  Stream<PatientsListState> mapEventToState(PatientsListEvent event) async* {
    yield* event.map(load: _load);
  }

  Stream<PatientsListState> _load(_Load event) async* {
    yield PatientsListState.loading();
    final result = await getPatientsUsecase(NoParams());
    yield result.fold(
      (failure) => PatientsListState.error(failure),
      (data) => data.isEmpty ? PatientsListState.empty() : PatientsListState.data(data),
    );
  }
}
