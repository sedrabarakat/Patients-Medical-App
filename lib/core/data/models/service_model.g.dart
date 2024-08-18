// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      description: json['description'] as String,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: json['price'] as String,
      sectionId: (json['section_id'] as num).toInt(),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'section_id': instance.sectionId,
    };
