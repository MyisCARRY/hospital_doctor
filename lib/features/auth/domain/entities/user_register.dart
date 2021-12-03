import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_register.freezed.dart';

part 'user_register.g.dart';

@freezed
class UserRegister with _$UserRegister {
  factory UserRegister.register({
    @JsonKey(name: 'email') required String login,
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

  factory UserRegister.fromJson(Map<String, dynamic> json) => _$UserRegisterFromJson(json);
}
