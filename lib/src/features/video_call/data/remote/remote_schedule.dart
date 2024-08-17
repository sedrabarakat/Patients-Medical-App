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

  Future<BaseModel>ReserveSchedule({
    required int online_guidance_schedule_id,
})async{
    final Response= await apiServices.post(AppUrl.registerSchedule,
    body: {
      "online_guidance_schedule_id": online_guidance_schedule_id,
    });
    return BaseModel(data: Response['data'],message: Response['message']);
  }
  Future<BaseModel>DeleteReserveSchedule({
    required int registeration_Id,
  })async{
    final Response= await apiServices.delete("${AppUrl.DeleteSchedule}$registeration_Id");

    return BaseModel(data: Response['data'],message: Response['message']);
  }





}