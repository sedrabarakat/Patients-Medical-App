// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['first_name'] as String,
      middleName: json['middle_name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String,
      userType: json['user_type'] as String,
      id: (json['id'] as num).toInt(),
      image: json['image'] as String?,
      description: json['description'] as String?,
      rememberToken: json['remember_token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'user_type': instance.userType,
      'image': instance.image,
      'description': instance.description,
      'remember_token': instance.rememberToken,
    };
