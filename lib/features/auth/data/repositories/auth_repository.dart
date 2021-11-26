import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/error/repository_request_handler.dart';
import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/features/auth/data/datasources/auth_datasource.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_login.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_register.dart';
import 'package:hospital_doctor/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.datasource,
  });

  final AuthDatasource datasource;

  @override
  FutureFailable<Token> loginUser(UserLogin user) {
    return RepositoryRequestHandler<Token>()(
      request: () => datasource.loginUser(user),
      defaultFailure: LoginFailure(),
    );
  }

  @override
  FutureFailable<Token> registerUser(UserRegister user) {
    return RepositoryRequestHandler<Token>()(
      request: () => datasource.registerUser(user),
      defaultFailure: RegisterFailure(),
    );
  }
}
