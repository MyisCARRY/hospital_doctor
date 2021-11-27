import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/helper/hive.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_login.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_register.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/delete_token_usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/login_usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/register_usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/save_token_usecase.dart';
import 'package:hospital_doctor/features/hive/domain/entities/hive_save_param.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.saveTokenUsecase,
    required this.getTokenUsecase,
    required this.deleteTokenUsecase,
    required this.loginUsecase,
    required this.registerUsecase,
  }) : super(AuthState.unauthenticated());

  final SaveTokenUsecase saveTokenUsecase;
  final GetTokenUsecase getTokenUsecase;
  final DeleteTokenUsecase deleteTokenUsecase;
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.map(
      signIn: _signIn,
      signUp: _signUp,
      signOut: (_) => _signOut(),
      checkStatus: (_) => _checkStatus(),
    );
  }

  Stream<AuthState> _signIn(_SignIn event) async* {
    final loginResult = await loginUsecase(event.user);
    yield* loginResult.fold(
      (failure) async* {
        yield AuthState.error(failure);
      },
      (token) async* {
        final saveResult = await saveTokenUsecase(HiveSaveParam(
          fieldName: HiveNames.token,
          value: token,
        ));
        yield saveResult.fold(
          (failure) => AuthState.error(failure),
          (data) => AuthState.authenticated(),
        );
      },
    );
  }

  Stream<AuthState> _signUp(_SignUp event) async* {
    final registerResult = await registerUsecase(event.user);
    yield* registerResult.fold(
      (failure) async* {
        yield AuthState.error(failure);
      },
      (token) async* {
        final saveResult = await saveTokenUsecase(HiveSaveParam(
          fieldName: HiveNames.token,
          value: token,
        ));
        yield saveResult.fold(
          (failure) => AuthState.error(failure),
          (data) => AuthState.authenticated(),
        );
      },
    );
  }

  Stream<AuthState> _signOut() async* {
    final result = await deleteTokenUsecase(HiveNames.token);
    yield result.fold(
      (failure) => AuthState.error(failure),
      (data) => AuthState.unauthenticated(),
    );
  }

  Stream<AuthState> _checkStatus() async* {
    final result = await getTokenUsecase(HiveNames.token);
    yield result.fold(
      (failure) => AuthState.error(failure),
      (data) => data == null ? AuthState.unauthenticated() : AuthState.authenticated(),
    );
  }
}
