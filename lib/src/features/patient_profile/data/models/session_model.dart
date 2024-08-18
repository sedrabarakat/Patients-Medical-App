import 'package:json_annotation/json_annotation.dart';
import 'package:patient_app/src/features/patient_profile/data/models/session_detail_model.dart';
part 'session_model.g.dart';

@JsonSerializable()
class SessionModel {
  final int id;
  @JsonKey(name: 'patient_id')
  final int patientId;
  final int closed;
  final String total;
  @JsonKey(name: 'session_details')
  final List<SessionDetailModel> sessionDetails;
  final SessionPatientModel? patient;
  @JsonKey(name: 'created_date')
  final String createdDate;
  @JsonKey(name: 'created_timestamp')
  final int createdTimeStamp;
  SessionModel({
    required this.closed,
    required this.createdDate,
    required this.createdTimeStamp,
    required this.id,
    required this.patientId,
    required this.total,
    this.patient,
    this.sessionDetails = const [],
  });
  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}

@JsonSerializable()
class SessionPatientModel {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'middle_name')
  final String middleName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'user_id')
  final int userid;
  SessionPatientModel({
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.middleName,
    required this.userid,
  });
  factory SessionPatientModel.fromJson(Map<String, dynamic> json) =>
      _$SessionPatientModelFromJson(json);
  Map<String, dynamic> toJson() => _$SessionPatientModelToJson(this);
}
