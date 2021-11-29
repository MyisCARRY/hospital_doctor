import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_register.dart';

part 'sign_up_form_event.dart';

part 'sign_up_form_state.dart';

part 'sign_up_form_bloc.freezed.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc() : super(SignUpFormState.data(UserRegister.empty(), false));

  UserRegister _user = UserRegister.empty();

  SignUpFormState get _data => SignUpFormState.data(_user, _valid);

  bool get _valid =>
      _user.login.isNotEmpty && _user.password.isNotEmpty && _user.firstName.isNotEmpty && _user.lastName.isNotEmpty;

  @override
  Stream<SignUpFormState> mapEventToState(SignUpFormEvent event) async* {
    yield* event.map(
      changeFirstName: _changeFirstName,
      changeLastName: _changeLastName,
      changeLogin: _changeLogin,
      changePassword: _changePassword,
    );
  }

  Stream<SignUpFormState> _changeFirstName(_ChangeFirstName event) async* {
    _user = _user.copyWith(firstName: event.firstName);
    yield _data;
  }

  Stream<SignUpFormState> _changeLastName(_ChangeLastName event) async* {
    _user = _user.copyWith(lastName: event.lastName);
    yield _data;
  }

  Stream<SignUpFormState> _changeLogin(_ChangeLogin event) async* {
    _user = _user.copyWith(login: event.login);
    yield _data;
  }

  Stream<SignUpFormState> _changePassword(_ChangePassword event) async* {
    _user = _user.copyWith(password: event.password);
    yield _data;
  }
}
