import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_login.freezed.dart';

part 'user_login.g.dart';

@freezed
class UserLogin with _$UserLogin {
  factory UserLogin.login({
    @JsonKey(name: 'email') required String login,
    required String password,
  }) = _UserLogin;

  factory UserLogin.empty() {
    return UserLogin.login(
      login: '',
      password: '',
    );
  }

  factory UserLogin.fromJson(Map<String, dynamic> json) => _$UserLoginFromJson(json);
}
