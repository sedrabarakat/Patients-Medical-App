import 'package:patient_app/core/domain/services/api_service.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/urls/app_url.dart';

class HomeRemote{

  ApiServices apiServices;

  HomeRemote(this.apiServices);


  Future<BaseModel>getPatientInfo()async{
    final Response = await apiServices.get(AppUrl.getPatientInfo);
    return BaseModel(data: Response['data'],);
  }

}