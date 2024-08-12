import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/src/features/video_call/data/models/schedules_model.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/apis_cubit/schedule_list_states.dart';
import '../../../domain/schedule_repo.dart';

class ScheduleListCubit extends Cubit<ScheduleListStates>{

  ScheduleRepo scheduleRepo;

  ScheduleListCubit(this.scheduleRepo):super(ScheduleListInitState());

  static ScheduleListCubit get(context)=>BlocProvider.of(context);

  List<SchedulesModel>Schedules=[];
  Future<void> getScheduleList() async {
    emit(Loading_GetSchedules_State());
    await scheduleRepo.getSchedules().then((value) {
      value.fold((error) {
        print(error);
        emit(Error_GetSchedules_State());
      }, (List) {
        Schedules = List;
        emit(Success_GetSchedules_State());
      });
    });
  }

  Future<void>reserveSchedule({required int online_guidance_schedule_id,
    required int doctor_id,
    required int patient_id})async{
    emit(Loading_ReserveSchedule_State());
    await scheduleRepo.reserveSchedule(
        online_guidance_schedule_id: online_guidance_schedule_id)
        .then((value){
      value.fold((error) {
        Error_ReserveSchedule_State.error=error;
        emit(Error_ReserveSchedule_State());
      }, (message) {
        emit(Success_ReserveSchedule_State());
        getScheduleList();
      });
    });
  }

  Future<void>deleteReserveSchedule({
    required int registeration_Id
    })async{
    emit(Loading_Delete_ReserveSchedule_State());
    await scheduleRepo.DeleteReserveSchedule(registeration_Id: registeration_Id)
        .then((value){
      value.fold((error) {
        Error_Delete_ReserveSchedule_State.error=error;
        emit(Error_Delete_ReserveSchedule_State());
      }, (message) {
        Success_Delete_ReserveSchedule_State.message=message;
        emit(Success_Delete_ReserveSchedule_State());
      });
    });
  }

  Future<void>AcceptCall({
    required String channelName
  })async{
    await scheduleRepo.AcceptCall(channelName: channelName)
        .then((value){
      value.fold((error) {
        emit(Error_AcceptCall_State());
      }, (message) {
        emit(Success_AcceptCall_State());
      });
    });
  }

  Future<void>DeclineCall({
    required String channelName
  })async{
    await scheduleRepo.DeclineCall(channelName: channelName)
        .then((value){
      value.fold((error) {
        emit(Error_DeclineCall_State());
      }, (message) {
        emit(Success_DeclineCall_State());
      });
    });
  }






}