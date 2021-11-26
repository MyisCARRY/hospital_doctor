import 'package:hospital_doctor/core/helper/type_aliases.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_login.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_register.dart';

abstract class AuthRepository {
  FutureFailable<Token> loginUser(UserLogin user);

  FutureFailable<Token> registerUser(UserRegister user);
}
