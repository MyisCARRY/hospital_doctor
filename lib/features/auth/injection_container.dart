import 'package:dio/dio.dart';
import 'package:hospital_doctor/features/auth/data/datasources/auth_datasource.dart';
import 'package:hospital_doctor/features/auth/data/repositories/auth_repository.dart';
import 'package:hospital_doctor/features/auth/domain/repositories/auth_repositories.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/login_usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/register_usecase.dart';
import 'package:hospital_doctor/injection_container.dart';

mixin AuthInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();
    final dio = sl<Dio>(instanceName: globalDio);

    // blocs

    // use cases
    sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
    sl.registerLazySingleton(() => RegisterUsecase(repository: sl()));

    // repositories
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(datasource: sl()));

    // data sources
    sl.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl(dio: dio));
  }
}
