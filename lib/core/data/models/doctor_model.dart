import 'package:json_annotation/json_annotation.dart';
import 'package:patient_app/core/data/models/section_model.dart';
import 'package:patient_app/core/data/models/user_model.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  @JsonKey(name: 'user_id')
  final int user_id;
   int id;
  @JsonKey(name: 'section_id')
   int section_id;
  @JsonKey(name: 'session_durtion')
   int session_durtion;
  @JsonKey(name: 'days_in_advance')
   int days_in_advance;
  UserModel user;
  SectionModel? section;

  DoctorModel(this.days_in_advance, this.id, this.section, this.session_durtion,
      this.section_id, this.user_id,this.user);

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}
