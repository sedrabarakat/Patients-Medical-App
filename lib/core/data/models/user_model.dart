import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String birthDate;
  final String age;
  final String gender;
  final String address;
  @JsonKey(name: 'blood_type')
  final String bloodType;
  @JsonKey(name: 'marital_status')
  final String maritalStatus;
  final String? habits;
  final String profession;
  final String diabetes;
  @JsonKey(name: 'blood_pressure')
  final String bloodPressure;
  final String wallet;
  @JsonKey(name: 'user_id')
  final int userId;

  final int id;
  @JsonKey(name: 'user')
  final PersonalInformationModel personalInformation;
  UserModel({
    required this.address,
    required this.age,
    required this.birthDate,
    required this.bloodPressure,
    required this.bloodType,
    required this.diabetes,
    required this.gender,
    required this.id,
    required this.maritalStatus,
    required this.personalInformation,
    required this.profession,
    required this.userId,
    required this.wallet,
    this.habits,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class PersonalInformationModel {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'middle_name')
  final String middleName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'user_type')
  final String userType;
  final String? image;
  final String? description;
  @JsonKey(name: 'remember_token')
  final String? rememberToken;
  PersonalInformationModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.phoneNumber,
    required this.userType,
    required this.id,
    this.image,
    this.description,
    this.rememberToken,
  });
  factory PersonalInformationModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalInformationModelFromJson(json);
  Map<String, dynamic> toJson() => _$PersonalInformationModelToJson(this);

  String get fullName => "$firstName $lastName";
}
