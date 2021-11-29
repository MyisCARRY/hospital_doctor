import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/hive/domain/entities/hive_save_param.dart';
import 'package:hospital_doctor/features/hive/domain/use_cases/save_hive_field_usecase.dart';

class SaveTokenUsecase extends Usecase<bool, HiveSaveParam<Token>> {
  SaveTokenUsecase({
    required this.saveHiveFieldUsecase,
  });

  final SaveHiveFieldUsecase saveHiveFieldUsecase;

  @override
  FutureFailable<bool> call(HiveSaveParam<Token> param) {
    return saveHiveFieldUsecase(param);
  }
}
