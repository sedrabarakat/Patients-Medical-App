// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchedulesModel _$SchedulesModelFromJson(Map<String, dynamic> json) =>
    SchedulesModel(
      (json['id'] as num).toInt(),
      (json['doctor_id'] as num).toInt(),
      json['date'] as String,
      json['from_min'] as String,
      json['to_min'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      (json['my_registeration_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SchedulesModelToJson(SchedulesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctor_id,
      'my_registeration_id': instance.my_registeration_id,
      'date': instance.date,
      'from_min': instance.from_min,
      'to_min': instance.to_min,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'doctor': instance.doctor,
    };
