import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/hive/domain/repositories/hive_repository.dart';

class GetHiveFieldUsecase<T> extends Usecase<T?, String> {
  GetHiveFieldUsecase({
    required this.repository,
  });

  final HiveRepository repository;

  @override
  FutureFailable<T?> call(String param) {
    return repository.getField<T>(param);
  }
}
