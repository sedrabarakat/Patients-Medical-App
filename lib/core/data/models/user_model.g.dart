// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      address: json['address'] as String,
      age: json['age'] as String,
      birthDate: json['birthDate'] as String,
      bloodPressure: json['blood_pressure'] as String,
      bloodType: json['blood_type'] as String,
      diabetes: json['diabetes'] as String,
      gender: json['gender'] as String,
      id: (json['id'] as num).toInt(),
      maritalStatus: json['marital_status'] as String,
      personalInformation: PersonalInformationModel.fromJson(
          json['user'] as Map<String, dynamic>),
      profession: json['profession'] as String,
      userId: (json['user_id'] as num).toInt(),
      wallet: json['wallet'] as String,
      habits: json['habits'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'birthDate': instance.birthDate,
      'age': instance.age,
      'gender': instance.gender,
      'address': instance.address,
      'blood_type': instance.bloodType,
      'marital_status': instance.maritalStatus,
      'habits': instance.habits,
      'profession': instance.profession,
      'diabetes': instance.diabetes,
      'blood_pressure': instance.bloodPressure,
      'wallet': instance.wallet,
      'user_id': instance.userId,
      'id': instance.id,
      'user': instance.personalInformation,
    };

PersonalInformationModel _$PersonalInformationModelFromJson(
        Map<String, dynamic> json) =>
    PersonalInformationModel(
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

Map<String, dynamic> _$PersonalInformationModelToJson(
        PersonalInformationModel instance) =>
    <String, dynamic>{
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
