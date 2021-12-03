part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  factory AuthEvent.signIn(Token token) = _SignIn;

  factory AuthEvent.signOut() = _SignOut;

  factory AuthEvent.checkStatus() = _CheckStatus;
}
