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
    final response = await dio.post('/doctor/login', data: user.toJson());
    final result = Token.fromJson(response.data);
    return result;
  }

  @override
  Future<Token> registerUser(UserRegister user) async {
    await dio.post('/doctor/register', data: user.toJson());
    final result = await loginUser(UserLogin.login(login: user.login, password: user.password));
    return result;
  }
}
