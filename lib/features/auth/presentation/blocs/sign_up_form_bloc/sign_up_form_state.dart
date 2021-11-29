part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  factory SignUpFormState.data(UserRegister user, bool valid) = _Data;
}
