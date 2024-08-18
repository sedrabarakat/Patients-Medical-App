// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionDetailModel _$SessionDetailModelFromJson(Map<String, dynamic> json) =>
    SessionDetailModel(
      createdDate: json['created_date'] as String,
      createdTimeStamp: (json['created_timestamp'] as num).toInt(),
      doctorId: (json['doctor_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      serviceId: (json['service_id'] as num).toInt(),
      sessionId: (json['session_id'] as num).toInt(),
      files: (json['protected_files'] as List<dynamic>?)
              ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      labStatus: json['lab_status'] as String?,
      description: json['description'] as String?,
      doctor: json['doctor'] == null
          ? null
          : DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionDetailModelToJson(SessionDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': instance.sessionId,
      'service_id': instance.serviceId,
      'doctor_id': instance.doctorId,
      'lab_status': instance.labStatus,
      'description': instance.description,
      'created_date': instance.createdDate,
      'created_timestamp': instance.createdTimeStamp,
      'doctor': instance.doctor,
      'protected_files': instance.files,
    };
