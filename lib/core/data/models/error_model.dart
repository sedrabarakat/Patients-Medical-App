import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  @JsonKey(readValue: readErrorValue)
  final String message;
  ErrorModel({required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
  static readErrorValue(map, value) {
    return map['message'] ?? map['error'];
  }
}
