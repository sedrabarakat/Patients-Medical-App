import 'package:dartz/dartz.dart';
import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/appointments/data/datasources/appointment_remote_data_source.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_day_date_model.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_model.dart';

class AppointmentRepo {
  final AppointmentRemoteDataSource _remote;
  AppointmentRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModel<AppointmentDayDateModel>>>
      getAppointmentInSpecificDayAndDate(
          {required int id, required String date, required String day}) async {
    try {
      final response = await _remote.getAppointmentInSpecificDayAndDate(
          id: id, date: date, day: day);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<AppointmentModel>>>
      makeAppointment(
          {required String doctorId,
          required String patientId,
          required String date,
          required String startMin}) async {
    try {
      final response = await _remote.makeAppointment(
          doctorId: doctorId,
          patientId: patientId,
          date: date,
          startMin: startMin);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
