import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/data/models/user_model.dart';
import 'package:patient_app/core/domain/urls/app_url.dart';
import 'package:patient_app/core/helper/dio_helper.dart';
import 'package:patient_app/core/interceptors/token_interceptor.dart';

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
    DioHelper().dio.interceptors.add(TokenInterceptor(response['token']));
    return BaseModel.fromJson(
        response, (json) => PersonalInformationModel.fromJson(json));
  }
}
