import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';
@JsonSerializable()
class UserModel {
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
  UserModel({
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
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  String get fullName => "$firstName $lastName";
}