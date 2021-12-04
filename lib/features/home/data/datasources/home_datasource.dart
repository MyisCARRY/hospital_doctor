import 'package:dio/dio.dart';
import 'package:hospital_doctor/features/home/domain/entities/patient.dart';

abstract class HomeDatasource {
  Future<List<Patient>> getPatientsList();
}

class HomeDatasourceImpl extends HomeDatasource {
  HomeDatasourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<Patient>> getPatientsList() async {
    final response = await dio.get('/doctor/myPatients');
    final result = (response.data as List).map((json) => Patient.fromJson(json)).toList();
    return result;
  }
}
