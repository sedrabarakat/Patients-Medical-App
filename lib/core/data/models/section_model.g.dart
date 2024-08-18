// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionModel _$SectionModelFromJson(Map<String, dynamic> json) => SectionModel(
      id: (json['id'] as num).toInt(),
      sectionName: json['name'] as String,
      image: SectionModel.imageValue(json, 'image') as String,
      service: (json['service'] as List<dynamic>?)
          ?.map((e) => SectionService.fromJson(e as Map<String, dynamic>))
          .toList(),
      doctor: (json['doctor'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionModelToJson(SectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.sectionName,
      'image': instance.image,
      'doctor': instance.doctor,
      'service': instance.service,
    };

SectionService _$SectionServiceFromJson(Map<String, dynamic> json) =>
    SectionService(
      name: json['name'] as String,
      price: json['price'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$SectionServiceToJson(SectionService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
