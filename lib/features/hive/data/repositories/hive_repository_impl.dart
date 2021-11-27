import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/error/repository_request_handler.dart';
import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/features/hive/data/datasources/hive_datasource.dart';
import 'package:hospital_doctor/features/hive/domain/entities/hive_save_param.dart';
import 'package:hospital_doctor/features/hive/domain/repositories/hive_repository.dart';

class HiveRepositoryImpl extends HiveRepository {
  HiveRepositoryImpl({required this.datasource});

  final HiveDatasource datasource;

  @override
  FutureFailable<T?> getField<T>(String fieldName) async {
    return RepositoryRequestHandler<T?>()(
      request: () => datasource.getField<T>(fieldName),
      defaultFailure: HiveGetFieldFailure(),
    );
  }

  @override
  FutureFailable<bool> saveField(HiveSaveParam param) async {
    return RepositoryRequestHandler<bool>()(
      request: () => datasource.saveField(param),
      defaultFailure: HiveSaveFieldFailure(),
    );
  }

  @override
  FutureFailable<bool> deleteField(String fieldName) async {
    return RepositoryRequestHandler<bool>()(
      request: () => datasource.deleteField(fieldName),
      defaultFailure: HiveDeleteFieldFailure(),
    );
  }
}
