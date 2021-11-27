import 'package:hive/hive.dart';
import 'package:hospital_doctor/features/hive/domain/entities/hive_save_param.dart';

abstract class HiveDatasource {
  Future<T?> getField<T>(String fieldName);

  Future<bool> saveField(HiveSaveParam param);

  Future<bool> deleteField(String fieldName);
}

class HiveDataSourceImpl extends HiveDatasource {
  HiveDataSourceImpl({required this.box});

  final Box box;

  @override
  Future<T?> getField<T>(String fieldName) async {
    return await box.get(fieldName);
  }

  @override
  Future<bool> saveField(HiveSaveParam param) async {
    await box.put(param.fieldName, param.value);
    return true;
  }

  @override
  Future<bool> deleteField(String fieldName) async {
    await box.delete(fieldName);
    return true;
  }
}
