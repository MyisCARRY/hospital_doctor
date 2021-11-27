part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.authenticated() = _Authenticated;

  factory AuthState.unauthenticated() = _Unauthenticated;

  factory AuthState.error(Failure failure) = _Error;
}
