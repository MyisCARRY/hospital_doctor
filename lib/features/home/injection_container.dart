import 'package:dio/dio.dart';
import 'package:hospital_doctor/features/home/data/datasources/home_datasource.dart';
import 'package:hospital_doctor/features/home/data/repositories/home_repository.dart';
import 'package:hospital_doctor/features/home/domain/repositories/home_repository.dart';
import 'package:hospital_doctor/features/home/domain/usecases/create_new_patient_usecase.dart';
import 'package:hospital_doctor/features/home/domain/usecases/get_patients_usecase.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/create_new_patient_vloc/create_new_patient_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/new_patient_form_bloc/new_patient_form_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/patients_list_bloc/patients_list_bloc.dart';
import 'package:hospital_doctor/injection_container.dart';

mixin HomeInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();
    final dio = sl<Dio>(instanceName: globalDio);

    // blocs
    sl.registerFactory(() => PatientsListBloc(getPatientsUsecase: sl()));
    sl.registerFactory(() => NewPatientFormBloc());
    sl.registerFactory(() => CreateNewPatientBloc(createNewPatientUsecase: sl()));

    // use cases
    sl.registerLazySingleton(() => GetPatientsUsecase(repository: sl()));
    sl.registerLazySingleton(() => CreateNewPatientUsecase(repository: sl()));

    // repositories
    sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(datasource: sl()));

    // data sources
    sl.registerLazySingleton<HomeDatasource>(() => HomeDatasourceImpl(dio: dio));
  }
}
