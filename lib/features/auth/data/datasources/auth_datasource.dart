import 'package:dio/dio.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_login.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_register.dart';

abstract class AuthDatasource {
  Future<Token> loginUser(UserLogin user);

  Future<Token> registerUser(UserRegister user);
}

class AuthDatasourceImpl extends AuthDatasource {
  AuthDatasourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<Token> loginUser(UserLogin user) async {
    // TODO(Piotr): connect to API
    await Future.delayed(const Duration(seconds: 2));
    return Token(accessToken: '123123123');
  }

  @override
  Future<Token> registerUser(UserRegister user) async {
    // TODO(Piotr): connect to API
    await Future.delayed(const Duration(seconds: 2));
    return Token(accessToken: '123123123');
  }
}
