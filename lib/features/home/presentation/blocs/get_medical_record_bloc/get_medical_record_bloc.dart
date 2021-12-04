import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record.dart';
import 'package:hospital_doctor/features/home/domain/usecases/get_medical_record_usecase.dart';

part 'get_medical_record_event.dart';

part 'get_medical_record_state.dart';

part 'get_medical_record_bloc.freezed.dart';

class GetMedicalRecordBloc extends Bloc<GetMedicalRecordEvent, GetMedicalRecordState> {
  GetMedicalRecordBloc({
    required this.getMedicalRecordUsecase,
  }) : super(GetMedicalRecordState.loading());

  final GetMedicalRecordUsecase getMedicalRecordUsecase;

  @override
  Stream<GetMedicalRecordState> mapEventToState(GetMedicalRecordEvent event) async* {
    yield* event.map(load: _load);
  }

  Stream<GetMedicalRecordState> _load(_Load event) async* {
    yield GetMedicalRecordState.loading();
    final result = await getMedicalRecordUsecase(event.patientId);
    yield result.fold(
      (failure) => GetMedicalRecordState.error(failure),
      (data) => GetMedicalRecordState.data(data),
    );
  }
}
