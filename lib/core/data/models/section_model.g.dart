// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionModel _$SectionModelFromJson(Map<String, dynamic> json) => SectionModel(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      sectionName: json['name'] as String,
    );

Map<String, dynamic> _$SectionModelToJson(SectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.sectionName,
      'image': instance.image,
    };
