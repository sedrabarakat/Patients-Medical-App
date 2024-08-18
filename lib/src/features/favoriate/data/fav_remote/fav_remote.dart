import 'package:patient_app/core/domain/services/api_service.dart';
import 'package:patient_app/core/domain/urls/app_url.dart';
import 'package:patient_app/core/routing/app_router.dart';

import '../../../../../core/data/models/base_model.dart';

class FavRemote{

  ApiServices apiServices;

  FavRemote(this.apiServices);

  Future<BaseModel>getFav()async{
    final response= await apiServices.post(AppUrl.getFav);
    return BaseModel(data: response['data'],message: response['message']);
  }

  Future<BaseModel>ToggleFave({
    required int id
})async{
    final response= await apiServices.post('${AppUrl.toggleFav}$id');
    return BaseModel(data: response['data'],message: response['message']);
  }
}