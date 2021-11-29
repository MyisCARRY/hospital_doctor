part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormEvent with _$SignUpFormEvent {
  factory SignUpFormEvent.changeFirstName(String firstName) = _ChangeFirstName;

  factory SignUpFormEvent.changeLastName(String lastName) = _ChangeLastName;

  factory SignUpFormEvent.changeLogin(String login) = _ChangeLogin;

  factory SignUpFormEvent.changePassword(String password) = _ChangePassword;
}
