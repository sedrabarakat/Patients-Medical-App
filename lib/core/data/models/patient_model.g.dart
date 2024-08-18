// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      address: json['address'] as String,
      age: json['age'] as String,
      birthDate: json['birth_date'] as String,
      bloodPressure: json['blood_pressure'] as bool,
      bloodType: json['blood_type'] as String,
      diabetes: json['diabetes'] as bool,
      gender: json['gender'] as String,
      id: (json['id'] as num).toInt(),
      maritalStatus: json['marital_status'] as String,
      personalInformation:
          UserModel.fromJson(json['user'] as Map<String, dynamic>),
      proffesion: json['proffesion'] as String,
      userId: (json['user_id'] as num).toInt(),
      wallet: (json['wallet'] as num).toInt(),
      habits: json['habits'] as String?,
      childrenNum: (json['children_num'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'birth_date': instance.birthDate,
      'age': instance.age,
      'gender': instance.gender,
      'address': instance.address,
      'blood_type': instance.bloodType,
      'marital_status': instance.maritalStatus,
      'habits': instance.habits,
      'proffesion': instance.proffesion,
      'children_num': instance.childrenNum,
      'diabetes': instance.diabetes,
      'blood_pressure': instance.bloodPressure,
      'wallet': instance.wallet,
      'user_id': instance.userId,
      'id': instance.id,
      'user': instance.personalInformation,
    };
