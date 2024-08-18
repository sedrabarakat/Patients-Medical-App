import 'package:json_annotation/json_annotation.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/src/features/patient_profile/data/models/file_model.dart';

part 'session_detail_model.g.dart';

@JsonSerializable()
class SessionDetailModel {
  final int id;
  @JsonKey(name: 'session_id')
  final int sessionId;
  @JsonKey(name: 'service_id')
  final int serviceId;
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  @JsonKey(name: 'lab_status')
  final String? labStatus;
  final String? description;
  @JsonKey(name: 'created_date')
  final String createdDate;
  @JsonKey(name: 'created_timestamp')
  final int createdTimeStamp;
  final DoctorModel? doctor;
  @JsonKey(name: 'protected_files')
  final List<FileModel> files;
  SessionDetailModel({
    required this.createdDate,
    required this.createdTimeStamp,
    required this.doctorId,
    required this.id,
    required this.serviceId,
    required this.sessionId,
    this.files = const [],
    this.labStatus,
    this.description,
    this.doctor,
  });
  factory SessionDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$SessionDetailModelToJson(this);
}
