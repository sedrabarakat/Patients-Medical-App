import 'package:patient_app/core/domain/services/api_service.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/data/models/doctor_model.dart';
import '../../../../../core/data/models/section_model.dart';
import '../../../../../core/domain/urls/app_url.dart';
import '../model/slider_model.dart';

class HomeRemote{

  ApiServices _apiServices;

  HomeRemote(this._apiServices);


  Future<BaseModel>getPatientInfo()async{
    final Response = await _apiServices.get(AppUrl.getPatientInfo);
    return BaseModel(data: Response['data'],);
  }

  Future<BaseModels> getDoctors() async {
    final response = await _apiServices.get(AppUrl.getDoctorsList);

    return BaseModels.fromJson(
        response['data'], (json) => DoctorModel.fromJson(json));
  }

  Future<BaseModels> getSections() async {
    final response = await _apiServices.get(AppUrl.getSections);
    return BaseModels.fromJson(
      response['data'],
          (json) => SectionModel.fromJson(json),
    );
  }

  Future<BaseModel<SectionModel>> getSectionInformation(int id) async {
    final response =
    await _apiServices.get("${AppUrl.getSectionInformation}$id");
    return BaseModel.fromJson(
      response,
          (json) => SectionModel.fromJson(json),
    );
  }

  Future<BaseModels> getSliders() async {
    final response = await _apiServices.get(AppUrl.getSliders);
    return BaseModels.fromJson(
      response['data'],
          (json) => SliderModel.fromJson(json),
    );
  }



}