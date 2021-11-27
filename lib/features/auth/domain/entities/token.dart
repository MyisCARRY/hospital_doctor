import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hospital_doctor/core/helper/hive.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token, HiveObjectMixin {
  @HiveType(typeId: HiveIds.tokenId, adapterName: HiveNames.token)
  factory Token({
    @HiveField(0) required String accessToken,
  }) = _Token;
}
