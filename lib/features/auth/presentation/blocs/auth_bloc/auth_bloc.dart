import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/helper/hive.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/delete_token_usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/get_token_usecase.dart';
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
  }) : super(AuthState.unauthenticated());

  final SaveTokenUsecase saveTokenUsecase;
  final GetTokenUsecase getTokenUsecase;
  final DeleteTokenUsecase deleteTokenUsecase;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.map(
      signIn: _signIn,
      signOut: (_) => _signOut(),
      checkStatus: (_) => _checkStatus(),
    );
  }

  Stream<AuthState> _signIn(_SignIn event) async* {
    final saveResult = await saveTokenUsecase(HiveSaveParam(
      fieldName: HiveNames.token,
      value: event.token,
    ));
    yield saveResult.fold(
          (failure) => AuthState.error(failure),
          (data) => AuthState.authenticated(),
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
    final result = await getTokenUsecase(NoParams());
    yield result.fold(
      (failure) => AuthState.error(failure),
      (data) => data == null ? AuthState.unauthenticated() : AuthState.authenticated(),
    );
  }
}
