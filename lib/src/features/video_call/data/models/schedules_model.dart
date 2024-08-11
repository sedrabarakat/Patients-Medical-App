
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/data/models/doctor_model.dart';

part 'schedules_model.g.dart';

@JsonSerializable()
class SchedulesModel{
  int id;
  int doctor_id;
  String  date;
  String from_min;
  String to_min;
  String created_at;
  String updated_at;
  DoctorModel doctor;


  SchedulesModel(this.id, this.doctor_id, this.date, this.from_min, this.to_min,
      this.created_at, this.updated_at,this.doctor);

  factory SchedulesModel.fromJson(Map<String,dynamic>json)=>_$SchedulesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SchedulesModelToJson(this);
}