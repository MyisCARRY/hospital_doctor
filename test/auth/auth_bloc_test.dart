import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/helper/hive.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_login.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_register.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/delete_token_usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/login_usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/register_usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/save_token_usecase.dart';
import 'package:hospital_doctor/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hospital_doctor/features/hive/domain/entities/hive_save_param.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([
  LoginUsecase,
  RegisterUsecase,
  GetTokenUsecase,
  SaveTokenUsecase,
  DeleteTokenUsecase,
])
void main() {
  late AuthBloc _authBloc;
  late MockLoginUsecase _mockLoginUsecase;
  late MockRegisterUsecase _mockRegisterUsecase;
  late MockGetTokenUsecase _mockGetTokenUsecase;
  late MockSaveTokenUsecase _mockSaveTokenUsecase;
  late MockDeleteTokenUsecase _mockDeleteTokenUsecase;
  late UserLogin _loginUser;
  late UserRegister _registerUser;
  late Token _token;
  late Failure _failure;
  late HiveSaveParam<Token> _hiveSaveParam;

  setUp(() {
    _mockLoginUsecase = MockLoginUsecase();
    _mockRegisterUsecase = MockRegisterUsecase();
    _mockGetTokenUsecase = MockGetTokenUsecase();
    _mockSaveTokenUsecase = MockSaveTokenUsecase();
    _mockDeleteTokenUsecase = MockDeleteTokenUsecase();

    _authBloc = AuthBloc(
      loginUsecase: _mockLoginUsecase,
      registerUsecase: _mockRegisterUsecase,
      getTokenUsecase: _mockGetTokenUsecase,
      saveTokenUsecase: _mockSaveTokenUsecase,
      deleteTokenUsecase: _mockDeleteTokenUsecase,
    );

    _loginUser = UserLogin.empty();
    _registerUser = UserRegister.empty();
    _token = Token(accessToken: '123');
    _failure = FailureTest();
    _hiveSaveParam = HiveSaveParam<Token>(
      fieldName: HiveNames.token,
      value: _token,
    );
  });

  void setUpSignInSuccess() => when(_mockLoginUsecase.call(_loginUser)).thenAnswer((_) async => Right(_token));

  void setUpSignInFailure() => when(_mockLoginUsecase.call(_loginUser)).thenAnswer((_) async => Left(_failure));

  void setUpSignUpSuccess() => when(_mockRegisterUsecase.call(_registerUser)).thenAnswer((_) async => Right(_token));

  void setUpSignUpFailure() => when(_mockRegisterUsecase.call(_registerUser)).thenAnswer((_) async => Left(_failure));

  void setUpGetTokenSuccess() =>
      when(_mockGetTokenUsecase.call(HiveNames.token)).thenAnswer((_) async => Right(_token));

  void setUpGetNullTokenSuccess() =>
      when(_mockGetTokenUsecase.call(HiveNames.token)).thenAnswer((_) async => const Right(null));

  void setUpGetTokenFailure() =>
      when(_mockGetTokenUsecase.call(HiveNames.token)).thenAnswer((_) async => Left(_failure));

  void setUpSaveTokenSuccess() =>
      when(_mockSaveTokenUsecase.call(_hiveSaveParam)).thenAnswer((_) async => const Right(true));

  void setUpSaveTokenFailure() =>
      when(_mockSaveTokenUsecase.call(_hiveSaveParam)).thenAnswer((_) async => Left(_failure));

  void setUpDeleteTokenSuccess() =>
      when(_mockDeleteTokenUsecase.call(HiveNames.token)).thenAnswer((_) async => const Right(true));

  void setUpDeleteTokenFailure() =>
      when(_mockDeleteTokenUsecase.call(HiveNames.token)).thenAnswer((_) async => Left(_failure));

  group(
    'AuthEvent.signIn()',
    () {
      blocTest<AuthBloc, AuthState>(
        'SUCCESS sign in and SUCCESS save token SHOULD emit AuthState.authenticated()',
        build: () {
          setUpSignInSuccess();
          setUpSaveTokenSuccess();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.signIn(_loginUser)),
        expect: () => [
          AuthState.authenticated(),
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'ERROR sign in and SUCCESS save token SHOULD emit AuthState.error()',
        build: () {
          setUpSignInFailure();
          setUpSaveTokenSuccess();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.signIn(_loginUser)),
        expect: () => [
          AuthState.error(_failure),
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'ERROR sign in and ERROR save token SHOULD emit AuthState.error()',
        build: () {
          setUpSignInFailure();
          setUpSaveTokenFailure();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.signIn(_loginUser)),
        expect: () => [
          AuthState.error(_failure),
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'SUCCESS sign in and ERROR save token SHOULD emit AuthState.error()',
        build: () {
          setUpSignInSuccess();
          setUpSaveTokenFailure();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.signIn(_loginUser)),
        expect: () => [
          AuthState.error(_failure),
        ],
      );
    },
  );

  group(
    'AuthEvent.signUp()',
    () {
      blocTest<AuthBloc, AuthState>(
        'SUCCESS sign up and SUCCESS save token SHOULD emit AuthState.authenticated()',
        build: () {
          setUpSignUpSuccess();
          setUpSaveTokenSuccess();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.signUp(_registerUser)),
        expect: () => [
          AuthState.authenticated(),
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'SUCCESS sign up and ERROR save token SHOULD emit AuthState.error()',
        build: () {
          setUpSignUpSuccess();
          setUpSaveTokenFailure();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.signUp(_registerUser)),
        expect: () => [
          AuthState.error(_failure),
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'ERROR sign up and ERROR save token SHOULD emit AuthState.error()',
        build: () {
          setUpSignUpFailure();
          setUpSaveTokenFailure();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.signUp(_registerUser)),
        expect: () => [
          AuthState.error(_failure),
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'ERROR sign up and SUCCESS save token SHOULD emit AuthState.error()',
        build: () {
          setUpSignUpFailure();
          setUpSaveTokenSuccess();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.signUp(_registerUser)),
        expect: () => [
          AuthState.error(_failure),
        ],
      );
    },
  );

  group(
    'AuthEvent.signOut()',
    () {
      blocTest<AuthBloc, AuthState>(
        'SUCCESS delete token SHOULD emit AuthState.unauthenticated()',
        build: () {
          setUpDeleteTokenSuccess();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.signOut()),
        expect: () => [
          AuthState.unauthenticated(),
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'ERROR delete token SHOULD emit AuthState.error()',
        build: () {
          setUpDeleteTokenFailure();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.signOut()),
        expect: () => [
          AuthState.error(_failure),
        ],
      );
    },
  );

  group(
    'AuthEvent.checkStatus()',
    () {
      blocTest<AuthBloc, AuthState>(
        'SUCCESS get token SHOULD emit AuthState.authenticated()',
        build: () {
          setUpGetTokenSuccess();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.checkStatus()),
        expect: () => [
          AuthState.authenticated(),
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'SUCCESS get token null SHOULD emit AuthState.unauthenticated()',
        build: () {
          setUpGetNullTokenSuccess();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.checkStatus()),
        expect: () => [
          AuthState.unauthenticated(),
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'ERROR get token SHOULD emit AuthState.error()',
        build: () {
          setUpGetTokenFailure();
          return _authBloc;
        },
        act: (bloc) => bloc.add(AuthEvent.checkStatus()),
        expect: () => [
          AuthState.error(_failure),
        ],
      );
    },
  );
}
