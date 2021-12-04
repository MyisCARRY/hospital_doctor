import 'package:dio/dio.dart';
import 'package:hospital_doctor/features/home/data/datasources/home_datasource.dart';
import 'package:hospital_doctor/features/home/data/repositories/home_repository.dart';
import 'package:hospital_doctor/features/home/domain/entities/medical_record.dart';
import 'package:hospital_doctor/features/home/domain/repositories/home_repository.dart';
import 'package:hospital_doctor/features/home/domain/usecases/create_new_patient_usecase.dart';
import 'package:hospital_doctor/features/home/domain/usecases/get_medical_record_usecase.dart';
import 'package:hospital_doctor/features/home/domain/usecases/get_patients_usecase.dart';
import 'package:hospital_doctor/features/home/domain/usecases/update_medical_record_usecase.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/create_new_patient_bloc/create_new_patient_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/get_medical_record_bloc/get_medical_record_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/medical_record_form_bloc/medical_record_form_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/new_patient_form_bloc/new_patient_form_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/patients_list_bloc/patients_list_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/update_medical_record_bloc/update_medical_record_bloc.dart';
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
    sl.registerFactory(() => GetMedicalRecordBloc(getMedicalRecordUsecase: sl()));
    sl.registerFactory(() => UpdateMedicalRecordBloc(updateMedicalRecordUsecase: sl()));
    sl.registerFactoryParam((MedicalRecord medicalRecord, _) => MedicalRecordFormBloc(
          initialMedicalRecord: medicalRecord,
        ));

    // use cases
    sl.registerLazySingleton(() => GetPatientsUsecase(repository: sl()));
    sl.registerLazySingleton(() => CreateNewPatientUsecase(repository: sl()));
    sl.registerLazySingleton(() => GetMedicalRecordUsecase(repository: sl()));
    sl.registerLazySingleton(() => UpdateMedicalRecordUsecase(repository: sl()));

    // repositories
    sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(datasource: sl()));

    // data sources
    sl.registerLazySingleton<HomeDatasource>(() => HomeDatasourceImpl(dio: dio));
  }
}
