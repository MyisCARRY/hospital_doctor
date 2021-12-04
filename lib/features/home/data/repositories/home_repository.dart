import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/error/repository_request_handler.dart';
import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/features/home/data/datasources/home_datasource.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';
import 'package:hospital_doctor/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({
    required this.datasource,
  });

  final HomeDatasource datasource;

  @override
  FutureFailable<List<Patient>> getPatientsList() {
    return RepositoryRequestHandler<List<Patient>>()(
      request: datasource.getPatientsList,
      defaultFailure: GetPatientsFailure(),
    );
  }
}
