// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      appointmentId: (json['appointment_id'] as num).toInt(),
      date: json['date'] as String,
      doctorFirstName: json['doctor_firstName'] as String,
      doctorId: json['doctor_id'] as String,
      doctorlastName: json['doctor_lastName'] as String,
      patientFirstName: json['patient_firstName'] as String,
      patientLastName: json['patient_lastName'] as String,
      sectionId: (json['section_id'] as num).toInt(),
      sectionName: json['section_name'] as String,
      startMin: json['start_min'] as String,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'appointment_id': instance.appointmentId,
      'patient_firstName': instance.patientFirstName,
      'patient_lastName': instance.patientLastName,
      'doctor_id': instance.doctorId,
      'doctor_firstName': instance.doctorFirstName,
      'doctor_lastName': instance.doctorlastName,
      'section_id': instance.sectionId,
      'section_name': instance.sectionName,
      'date': instance.date,
      'start_min': instance.startMin,
    };
