import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_day_date_model.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_model.dart';

abstract class AppointmentState {}

class AppointmentInitialState extends AppointmentState {}

class GetAppointmentSuccessState extends AppointmentState {
  final AppointmentDayDateModel appointment;
  GetAppointmentSuccessState(this.appointment);
}

class GetAppointmentErrorState extends AppointmentState {
  final NetworkExceptions error;
  GetAppointmentErrorState(this.error);
}

class GetAppointmentLoadingState extends AppointmentState {}

class MakeAppointmentLoadinState extends AppointmentState {}

class MakeAppointmentSuccessState extends AppointmentState {
  final AppointmentModel appointment;
  MakeAppointmentSuccessState(this.appointment);
}

class MakeAppointmentErrorState extends AppointmentState {
  final NetworkExceptions error;
  MakeAppointmentErrorState(this.error);
}
