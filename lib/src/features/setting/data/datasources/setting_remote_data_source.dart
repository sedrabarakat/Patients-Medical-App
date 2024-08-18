import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/domain/services/api_service.dart';
import 'package:patient_app/core/domain/urls/app_url.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_model.dart';

class SettingRemoteDataSource {
  final ApiServices _services;
  SettingRemoteDataSource(this._services);

  Future<BaseModels> getMyAppointment() async {
    final response = await _services.get(AppUrl.getMyAppointment);
    return BaseModels.fromJson(
        response['data'], (itemJson) => AppointmentModel.fromJson(itemJson));
  }

  Future<BaseModel> sendComplaint(String text) async {
    await _services.post(AppUrl.sendComplaint, body: {
      'text': text,
    });
    return BaseModel(data: null, message: "Sent Successfully");
  }

  Future<BaseModel> logout() async {
    await _services.post(AppUrl.logOut);
    return BaseModel(data: null, message: "Done");
  }

  Future<BaseModel> deleteAppointment(int id) async {
    await _services.delete("${AppUrl.deleteAppointment}$id");
    return BaseModel(data: null, message: "Appointment deleted successfully");
  }
}
