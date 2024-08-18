import 'package:json_annotation/json_annotation.dart';
part 'file_model.g.dart';

@JsonSerializable()
class FileModel {
  final int id;
  @JsonKey(name: 'doctor_id')
  final int? doctorId;
  @JsonKey(name: 'file_type')
  final String fileType;
  final String path;
  @JsonKey(name: 'created_date')
  final String createdDate;
  @JsonKey(name: 'created_timestamp')
  final int createdTimeStamp;
  bool downloaded;
  FileModel({
    required this.id,
    required this.fileType,
    required this.path,
    required this.createdDate,
    required this.createdTimeStamp,
    this.doctorId,
    this.downloaded = false,
  });
  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}
