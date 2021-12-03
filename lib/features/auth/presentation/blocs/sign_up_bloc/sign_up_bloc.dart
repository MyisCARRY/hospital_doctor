import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_register.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/register_usecase.dart';

class SignUpBloc extends AnyAnimatedButtonBloc<UserRegister, Token, Failure> {
  SignUpBloc({
    required this.registerUsecase,
  });

  final RegisterUsecase registerUsecase;

  @override
  Future<Either<Failure, Token>> asyncAction(UserRegister input) {
    return registerUsecase(input);
  }
}
