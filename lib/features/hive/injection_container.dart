import 'package:hive_flutter/hive_flutter.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/hive/data/datasources/hive_datasource.dart';
import 'package:hospital_doctor/features/hive/data/repositories/hive_repository_impl.dart';
import 'package:hospital_doctor/features/hive/domain/repositories/hive_repository.dart';
import 'package:hospital_doctor/features/hive/domain/use_cases/delete_hive_field_usecase.dart';
import 'package:hospital_doctor/features/hive/domain/use_cases/get_hive_field_usecase.dart';
import 'package:hospital_doctor/features/hive/domain/use_cases/save_hive_field_usecase.dart';
import 'package:hospital_doctor/injection_container.dart';

mixin HiveInjector on Injector {
  static const settingsBoxId = 'SETTINGS_BOX_ID';

  @override
  Future<void> init() async {
    await super.init();
    await Hive.initFlutter();
    Hive.registerAdapter(TOKEN_ADAPTER());

    // hive
    final box = await Hive.openBox(settingsBoxId);
    sl.registerLazySingleton<Box>(() => box, instanceName: settingsBoxId);

    // usecase
    sl.registerLazySingleton(() => GetHiveFieldUsecase<Token>(repository: sl()));
    sl.registerLazySingleton(() => SaveHiveFieldUsecase(repository: sl()));
    sl.registerLazySingleton(() => DeleteHiveFieldUsecase(repository: sl()));

    // repositories
    sl.registerLazySingleton<HiveRepository>(() => HiveRepositoryImpl(datasource: sl()));

    // data sources
    sl.registerLazySingleton<HiveDatasource>(() => HiveDataSourceImpl(box: box));
  }
}
