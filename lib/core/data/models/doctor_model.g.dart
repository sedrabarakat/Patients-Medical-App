// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      (json['days_in_advance'] as num).toInt(),
      (json['id'] as num).toInt(),
      json['section'] == null
          ? null
          : SectionModel.fromJson(json['section'] as Map<String, dynamic>),
      (json['session_durtion'] as num).toInt(),
      (json['section_id'] as num).toInt(),
      (json['user_id'] as num).toInt(),
      UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'id': instance.id,
      'section_id': instance.section_id,
      'session_durtion': instance.session_durtion,
      'days_in_advance': instance.days_in_advance,
      'user': instance.user,
      'section': instance.section,
    };
