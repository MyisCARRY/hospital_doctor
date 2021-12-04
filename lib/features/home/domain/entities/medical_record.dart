import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medical_record.freezed.dart';

part 'medical_record.g.dart';

@freezed
class MedicalRecord with _$MedicalRecord {
  factory MedicalRecord({
    @JsonKey(defaultValue: 0) required int pregnancies,
    @JsonKey(defaultValue: 0) required int glucose,
    @JsonKey(defaultValue: 0, name: 'bloodPresure') required int bloodPressure,
    @JsonKey(defaultValue: 0) required int skinThickness,
    @JsonKey(defaultValue: 0) required int insulin,
    @JsonKey(defaultValue: 0) required double bmi,
    @JsonKey(defaultValue: 0, name: 'diabetesPedigreeFunction') required double diabetes,
    @JsonKey(defaultValue: 0) required int age,
    required bool filled,
    bool? outcome,
  }) = _MedicalRecord;

  factory MedicalRecord.fromJson(Map<String, dynamic> json) => _$MedicalRecordFromJson(json);
}
