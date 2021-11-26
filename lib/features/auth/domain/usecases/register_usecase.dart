import 'package:dartz/dartz.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_register.dart';
import 'package:hospital_doctor/features/auth/domain/repositories/auth_repositories.dart';

class RegisterUsecase extends Usecase<Token, UserRegister> {
  RegisterUsecase({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<Failure, Token>> call(UserRegister param) {
    return repository.registerUser(param);
  }
}
