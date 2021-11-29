import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_login.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc() : super(SignInFormState.data(UserLogin.empty(), false));

  UserLogin _user = UserLogin.empty();

  SignInFormState get _data => SignInFormState.data(_user, _valid);

  bool get _valid => _user.login.isNotEmpty && _user.password.isNotEmpty;

  @override
  Stream<SignInFormState> mapEventToState(SignInFormEvent event) async* {
    yield* event.map(
      changeLogin: _changeLogin,
      changePassword: _changePassword,
    );
  }

  Stream<SignInFormState> _changeLogin(_ChangeLogin event) async* {
    _user = _user.copyWith(login: event.login);
    yield _data;
  }

  Stream<SignInFormState> _changePassword(_ChangePassword event) async* {
    _user = _user.copyWith(password: event.password);
    yield _data;
  }
}
