import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record_param.dart';
import 'package:hospital_doctor/features/home/domain/usecases/update_medical_record_usecase.dart';

class UpdateMedicalRecordBloc extends AnyAnimatedButtonBloc<MedicalRecordParam, MedicalRecord, Failure> {
  UpdateMedicalRecordBloc({
    required this.updateMedicalRecordUsecase,
  });

  final UpdateMedicalRecordUsecase updateMedicalRecordUsecase;

  @override
  Future<Either<Failure, MedicalRecord>> asyncAction(MedicalRecordParam input) async {
    return updateMedicalRecordUsecase(input);
  }
}
