import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_model.dart';

abstract class SettingState {}

class SettingInitialState extends SettingState {}

class GetMyAppointmentLoadingState extends SettingState {}

class GetMyAppointmentSuccessState extends SettingState {
  final List<AppointmentModel> appointments;
  GetMyAppointmentSuccessState(this.appointments);
}

class GetMyAppointmentErrorState extends SettingState {
  final NetworkExceptions error;
  GetMyAppointmentErrorState(this.error);
}

class SendComplaintLoadingState extends SettingState {}

class SendComplaintSuccessState extends SettingState {
  final String message;
  SendComplaintSuccessState(this.message);
}

class SendComplaintErrorState extends SettingState {
  final NetworkExceptions error;
  SendComplaintErrorState(this.error);
}

class LogOutSuccessState extends SettingState {
  final String message;
  LogOutSuccessState(this.message);
}

class LogoutErrorState extends SettingState {
  final NetworkExceptions error;
  LogoutErrorState(this.error);
}

class DeleteAppointmentSuccessState extends SettingState {
  final String message;
  DeleteAppointmentSuccessState(this.message);
}

class DeleteAppointmentErrorState extends SettingState {
  final NetworkExceptions error;
  DeleteAppointmentErrorState(this.error);
}
