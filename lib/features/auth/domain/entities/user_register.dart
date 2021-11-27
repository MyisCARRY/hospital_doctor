import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register.freezed.dart';

@freezed
class UserRegister with _$UserRegister {
  factory UserRegister.register({
    required String login,
    required String password,
    required String firstName,
    required String lastName,
  }) = _UserRegister;

  factory UserRegister.empty() {
    return UserRegister.register(
      login: '',
      password: '',
      firstName: '',
      lastName: '',
    );
  }
}
