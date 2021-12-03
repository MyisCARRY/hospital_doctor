import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_login.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/login_usecase.dart';

class SignInBloc extends AnyAnimatedButtonBloc<UserLogin, Token, Failure> {
  SignInBloc({
    required this.loginUsecase,
  });

  final LoginUsecase loginUsecase;

  @override
  Future<Either<Failure, Token>> asyncAction(UserLogin input) {
    return loginUsecase(input);
  }
}
