import 'package:dartz/dartz.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_login.dart';
import 'package:hospital_doctor/features/auth/domain/repositories/auth_repositories.dart';

class LoginUsecase extends Usecase<Token, UserLogin> {
  LoginUsecase({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<Failure, Token>> call(UserLogin param) {
    return repository.loginUser(param);
  }
}
