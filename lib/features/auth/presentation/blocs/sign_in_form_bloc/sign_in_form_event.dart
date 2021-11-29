part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  factory SignInFormEvent.changeLogin(String login) = _ChangeLogin;

  factory SignInFormEvent.changePassword(String password) = _ChangePassword;
}
