import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/hive/domain/use_cases/get_hive_field_usecase.dart';

class GetTokenUsecase extends Usecase<Token?, String> {
  GetTokenUsecase({
    required this.getHiveFieldUsecase,
  });

  final GetHiveFieldUsecase<Token> getHiveFieldUsecase;

  @override
  FutureFailable<Token?> call(String param) {
    return getHiveFieldUsecase(param);
  }
}
