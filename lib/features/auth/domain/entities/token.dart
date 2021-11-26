import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';

@freezed
class Token with _$Token {
  factory Token({
    required String accessToken,
  }) = _Token;
}
