// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) => FileModel(
      id: (json['id'] as num).toInt(),
      fileType: json['file_type'] as String,
      path: json['path'] as String,
      createdDate: json['created_date'] as String,
      createdTimeStamp: (json['created_timestamp'] as num).toInt(),
      doctorId: (json['doctor_id'] as num?)?.toInt(),
      downloaded: json['downloaded'] as bool? ?? false,
    );

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctorId,
      'file_type': instance.fileType,
      'path': instance.path,
      'created_date': instance.createdDate,
      'created_timestamp': instance.createdTimeStamp,
      'downloaded': instance.downloaded,
    };
