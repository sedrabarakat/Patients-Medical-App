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




}