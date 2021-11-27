part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  factory AuthEvent.signIn(UserLogin user) = _SignIn;

  factory AuthEvent.signUp(UserRegister user) = _SignUp;

  factory AuthEvent.signOut() = _SignOut;

  factory AuthEvent.checkStatus() = _CheckStatus;
}
