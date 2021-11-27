import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/hive/domain/entities/hive_save_param.dart';
import 'package:hospital_doctor/features/hive/domain/repositories/hive_repository.dart';

class SaveHiveFieldUsecase extends Usecase<bool, HiveSaveParam> {
  SaveHiveFieldUsecase({
    required this.repository,
  });

  final HiveRepository repository;

  @override
  FutureFailable<bool> call(HiveSaveParam param) {
    return repository.saveField(param);
  }
}
