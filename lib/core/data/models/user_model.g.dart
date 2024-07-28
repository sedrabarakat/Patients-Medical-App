// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      description: json['description'] as String,
      firstName: json['first_name'] as String,
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String,
      rememberToken: json['remember_token'] as String,
      userType: json['user_type'] as String,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'user_type': instance.userType,
      'image': instance.image,
      'description': instance.description,
      'remember_token': instance.rememberToken,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
