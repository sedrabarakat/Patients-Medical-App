import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/helper/time_helper.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_day_date_model.dart';
import 'package:patient_app/src/features/appointments/domain/appointment_repo.dart';
import 'package:patient_app/src/features/appointments/presentation/cubit/appointment_state.dart';
import 'package:progress_state_button/progress_button.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo _repo;
  AppointmentCubit(this._repo) : super(AppointmentInitialState());

  DateTime? selectedDate;
  ButtonState bookAppointmetButtonState = ButtonState.idle;
  String? startMin;
  AppointmentDayDateModel? appointmentDayDateModel;
  Future<void> getAppointmentInSpecificDayAndDate(int doctorId) async {
    emit(GetAppointmentLoadingState());
    final response = await _repo.getAppointmentInSpecificDayAndDate(
      id: doctorId,
      date: TimeHelper.dateFormat(date: selectedDate!),
      day: TimeHelper.getDayOfWeek(date: selectedDate!),
    );
    response.fold((error) {
      emit(GetAppointmentErrorState(error));
    }, (data) {
      appointmentDayDateModel = data.data!;
      emit(GetAppointmentSuccessState(data.data!));
    });
  }

  Future<void> makeAppointment(int doctorId) async {
    bookAppointmetButtonState = ButtonState.loading;
    emit(MakeAppointmentLoadinState());
    final response = await _repo.makeAppointment(
        doctorId: doctorId.toString(),
        date: TimeHelper.dateFormat(date: selectedDate!),
        startMin: startMin!);
    response.fold((error) {
      bookAppointmetButtonState = ButtonState.fail;
      emit(MakeAppointmentErrorState(error));
    }, (data) {
      bookAppointmetButtonState = ButtonState.idle;

      appointmentDayDateModel!.availableTimes.removeWhere(
        (element) => element == data.data!,
      );
      if (appointmentDayDateModel!.availableTimes.isNotEmpty) {
        startMin = appointmentDayDateModel!.availableTimes[0];
      }
      startMin = null;
      emit(MakeAppointmentSuccessState());
      emit(GetAppointmentSuccessState(appointmentDayDateModel!));
    });
  }
}
