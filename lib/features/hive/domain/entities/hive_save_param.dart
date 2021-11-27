import 'package:equatable/equatable.dart';

class HiveSaveParam<T> extends Equatable {
  HiveSaveParam({
    required this.fieldName,
    required this.value,
  });

  final String fieldName;
  final T value;

  @override
  List<Object?> get props => [fieldName, value];
}
