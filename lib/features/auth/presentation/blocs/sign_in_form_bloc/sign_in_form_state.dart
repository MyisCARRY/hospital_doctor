part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  factory SignInFormState.data(UserLogin user, bool valid) = _Data;
}
