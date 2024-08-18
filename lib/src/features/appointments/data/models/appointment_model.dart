import 'package:json_annotation/json_annotation.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  final int? id;
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  @JsonKey(name: 'patient_id')
  final int patientId;
  final String date;
  @JsonKey(name: 'start_min')
  final String startMin;
  final DoctorModel doctor;
  AppointmentModel({
    this.id,
    required this.date,
    required this.doctor,
    required this.doctorId,
    required this.patientId,
    required this.startMin,
  });
  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}
