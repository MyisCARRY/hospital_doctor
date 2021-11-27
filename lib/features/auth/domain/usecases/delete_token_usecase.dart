import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/hive/domain/use_cases/delete_hive_field_usecase.dart';

class DeleteTokenUsecase extends Usecase<bool, String> {
  DeleteTokenUsecase({
    required this.deleteHiveFieldUsecase,
  });

  final DeleteHiveFieldUsecase deleteHiveFieldUsecase;

  @override
  FutureFailable<bool> call(String param) {
    return deleteHiveFieldUsecase(param);
  }
}
