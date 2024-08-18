// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: (json['id'] as num?)?.toInt(),
      date: json['date'] as String,
      doctor: DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      doctorId: (json['doctor_id'] as num).toInt(),
      patientId: (json['patient_id'] as num).toInt(),
      startMin: json['start_min'] as String,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctorId,
      'patient_id': instance.patientId,
      'date': instance.date,
      'start_min': instance.startMin,
      'doctor': instance.doctor,
    };
