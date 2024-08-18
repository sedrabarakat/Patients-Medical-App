import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/domain/services/api_service.dart';
import 'package:patient_app/core/domain/urls/app_url.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_day_date_model.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_model.dart';

class AppointmentRemoteDataSource {
  final ApiServices _services;
  AppointmentRemoteDataSource(this._services);

  Future<BaseModel<AppointmentDayDateModel>> getAppointmentInSpecificDayAndDate(
      {required int id, required String date, required String day}) async {
    final response =
        await _services.get("${AppUrl.getDoctorAppointment}$id", queryParams: {
      'date': date,
      'dayOfWeek': day,
    });
    return BaseModel.fromJson(
        response, (json) => AppointmentDayDateModel.fromJson(json));
  }

  Future<BaseModel<AppointmentModel>> makeAppointment(
      {required String doctorId,
      required String patientId,
      required String date,
      required String startMin}) async {
    final response = await _services.post(AppUrl.makeAppointment, body: {
      'doctor_id': doctorId,
      'patient_id': patientId,
      'date': date,
      'start_min': startMin,
    });
    return BaseModel.fromJson(
        response, (json) => AppointmentModel.fromJson(json));
  }
}
