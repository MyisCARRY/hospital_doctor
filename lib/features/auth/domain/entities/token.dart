import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hospital_doctor/core/helper/hive.dart';

part 'token.freezed.dart';

part 'token.g.dart';

@freezed
class Token with _$Token {
  @HiveType(typeId: HiveIds.tokenId, adapterName: HiveAdaptersNames.token)
  factory Token({
   @JsonKey(name: 'token') @HiveField(1) required String accessToken,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
