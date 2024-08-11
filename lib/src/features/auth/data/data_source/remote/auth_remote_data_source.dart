import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/data/models/user_model.dart';
import 'package:patient_app/core/domain/urls/app_url.dart';
import 'package:patient_app/core/helper/dio_helper.dart';
import '../../../../../../core/data/data_source/local.dart';
import '../../../../../../core/domain/services/api_service.dart';

class AuthRemoteDataSource {
  final ApiServices _apiServices;

  AuthRemoteDataSource(this._apiServices);
  Future<BaseModel> requestCode(String phoneNumber) async {
    final response = await _apiServices.post(
      AppUrl.requestCode,
      body: {
        'phone_number': phoneNumber,
      },
    );
    return BaseModel(data: null, message: response['message']);
  }

  Future<BaseModel<PersonalInformationModel>> verifiyCode(
      String phoneNumber, String code) async {
    final response = await _apiServices.post(AppUrl.verifyCode, body: {
      'phone_number': phoneNumber,
      'code': code,
    });
    await HiveService.Auth_Box!.put('Token',response['token']);
    DioHelper().addTokenInterceptor();
    return BaseModel.fromJson(
        response, (json) => PersonalInformationModel.fromJson(json));
  }

  Future<BaseModel<UserModel>> register({
    required String firstName,
    required String middleName,
    required String lastName,
    required String phoneNumber,
    required String birthDate,
    required String address,
    required String gender,
    required String bloodType,
    required String maritalStatus,
    required String proffesion,
    required int diabetes,
    required int bloodPressure,
    required int wallet,
    required String age,
    String? description,
    String? habits,
    Uint8List? image,
    int? childrenNum,
  }) async {
    final response = await _apiServices.post(
      AppUrl.register,
//
      formData: FormData.fromMap(
        {
          'first_name': firstName,
          'middle_name': middleName,
          'last_name': lastName,
          'phone_number': phoneNumber,
          'description': description,
          'image': image != null
              ? MultipartFile.fromBytes(image, filename: "$phoneNumber.jpeg")
              : null,
          'birth_date': birthDate,
          'age': age,
          'gender': gender,
          'address': address,
          'blood_type': bloodType,
          'marital_status': maritalStatus,
          'children_num': childrenNum,
          'habits': habits,
          'proffesion': proffesion,
          'diabetes': diabetes,
          'blood_pressure': bloodPressure,
          'wallet': wallet,
        },
      ),
    );
    return BaseModel.fromJson(response, (json) => UserModel.fromJson(json));
  }
}
