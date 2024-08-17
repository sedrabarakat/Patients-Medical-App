// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      (json['id'] as num).toInt(),
      DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      json['channel'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'channel': instance.channel,
      'token': instance.token,
    };
