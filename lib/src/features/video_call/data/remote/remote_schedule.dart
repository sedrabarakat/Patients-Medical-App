import 'package:patient_app/core/domain/services/api_service.dart';
import 'package:patient_app/core/domain/urls/app_url.dart';

import '../../../../../core/data/models/base_model.dart';

class RemoteSchedule{
  ApiServices apiServices;

  RemoteSchedule(this.apiServices);

  Future<BaseModel>getOnlineSchedule()async{
    final Response= await apiServices.get(AppUrl.getOnlineSchedule);

    return BaseModel(data: Response['data'],message: Response['message']);
  }


}