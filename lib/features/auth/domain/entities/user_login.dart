import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login.freezed.dart';

@freezed
class UserLogin with _$UserLogin {
  factory UserLogin.login({
    required String login,
    required String password,
  }) = _UserLogin;

  factory UserLogin.empty() {
    return UserLogin.login(
      login: '',
      password: '',
    );
  }
}
