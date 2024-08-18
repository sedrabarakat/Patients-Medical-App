// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      closed: (json['closed'] as num).toInt(),
      createdDate: json['created_date'] as String,
      createdTimeStamp: (json['created_timestamp'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      patientId: (json['patient_id'] as num).toInt(),
      total: json['total'] as String,
      patient: json['patient'] == null
          ? null
          : SessionPatientModel.fromJson(
              json['patient'] as Map<String, dynamic>),
      sessionDetails: (json['session_details'] as List<dynamic>?)
              ?.map(
                  (e) => SessionDetailModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient_id': instance.patientId,
      'closed': instance.closed,
      'total': instance.total,
      'session_details': instance.sessionDetails,
      'patient': instance.patient,
      'created_date': instance.createdDate,
      'created_timestamp': instance.createdTimeStamp,
    };

SessionPatientModel _$SessionPatientModelFromJson(Map<String, dynamic> json) =>
    SessionPatientModel(
      firstName: json['first_name'] as String,
      id: (json['id'] as num).toInt(),
      lastName: json['last_name'] as String,
      middleName: json['middle_name'] as String,
      userid: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$SessionPatientModelToJson(
        SessionPatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'user_id': instance.userid,
    };
