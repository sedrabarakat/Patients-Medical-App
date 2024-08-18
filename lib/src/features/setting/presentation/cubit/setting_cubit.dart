import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/data/data_source/local.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_model.dart';
import 'package:patient_app/src/features/setting/domain/setting_repo.dart';
import 'package:patient_app/src/features/setting/presentation/cubit/setting_state.dart';
import 'package:progress_state_button/progress_button.dart';

class SettingCubit extends Cubit<SettingState> {
  final SettingRepo _repo;
  SettingCubit(this._repo) : super(SettingInitialState());
  List<AppointmentModel> myAppointment = [];
  ButtonState sendComplaintButtonState = ButtonState.idle;
  TextEditingController complaintTextEditingControlelr =
      TextEditingController();
  GlobalKey<FormState> complaintFormKey = GlobalKey<FormState>();
  Future<void> getMyAppointment() async {
    emit(GetMyAppointmentLoadingState());
    myAppointment.clear();
    final response = await _repo.getMyAppointment();
    response.fold((error) {
      emit(GetMyAppointmentErrorState(error));
    }, (data) {
      for (int i = 0; i < data.list.length; i++) {
        AppointmentModel temp = data.list[i] as AppointmentModel;
        myAppointment.add(temp);
      }
      emit(GetMyAppointmentSuccessState(myAppointment));
    });
  }

  Future<void> sendComplaint() async {
    sendComplaintButtonState = ButtonState.loading;
    emit(SendComplaintLoadingState());
    final response =
        await _repo.sendComplaint(complaintTextEditingControlelr.text);
    return response.fold(
      (error) {
        sendComplaintButtonState = ButtonState.fail;
        emit(SendComplaintErrorState(error));
      },
      (data) {
        sendComplaintButtonState = ButtonState.idle;
        complaintTextEditingControlelr.clear();
        emit(SendComplaintSuccessState(data.message));
      },
    );
  }

  Future<void> logOut() async {
    final response = await _repo.logOut();
    response.fold((error) => emit(LogoutErrorState(error)), (data) async {
      await HiveService.Auth_Box!.delete('Token');
      emit(LogOutSuccessState(data.message));
    });
  }

  Future<void> deleteAppointment(int id) async {
    final response = await _repo.deleteAppointment(id);
    response.fold((error) {
      emit(DeleteAppointmentErrorState(error));
    }, (data) {
      myAppointment.removeWhere((elmenet) => elmenet.id == id);
      emit(DeleteAppointmentSuccessState(data.message));
      emit(GetMyAppointmentSuccessState(myAppointment));
    });
  }
}
