import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/features/home/domain/entities/new_patient.dart';
import 'package:hospital_doctor/features/home/domain/usecases/create_new_patient_usecase.dart';

class CreateNewPatientBloc extends AnyAnimatedButtonBloc<NewPatient, bool, Failure> {
  CreateNewPatientBloc({
    required this.createNewPatientUsecase,
  });

  final CreateNewPatientUsecase createNewPatientUsecase;

  @override
  Future<Either<Failure, bool>> asyncAction(NewPatient input) {
    return createNewPatientUsecase(input);
  }
}
