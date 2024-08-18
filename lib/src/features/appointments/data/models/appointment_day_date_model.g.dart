// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_day_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDayDateModel _$AppointmentDayDateModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentDayDateModel(
      availableTimes: (json['available_times'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      date: json['date'] as String,
      day: json['day'] as String,
    );

Map<String, dynamic> _$AppointmentDayDateModelToJson(
        AppointmentDayDateModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'available_times': instance.availableTimes,
    };
