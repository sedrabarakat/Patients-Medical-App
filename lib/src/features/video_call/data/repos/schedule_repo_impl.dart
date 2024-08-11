import 'package:dartz/dartz.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/video_call/data/models/schedules_model.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../domain/schedule_repo.dart';
import '../remote/remote_schedule.dart';

class ScheduleRepoImpl extends ScheduleRepo{

  RemoteSchedule remoteSource;

  ScheduleRepoImpl(this.remoteSource);

  @override
  Future<Either<NetworkExceptions,List<SchedulesModel>>>getSchedules()async{
    try {
      List<SchedulesModel> list=[];
      BaseModel baseModel = await remoteSource.getOnlineSchedule();
      for(int i=0;i<baseModel.data.length;i++){
        list.add(
            SchedulesModel.fromJson(baseModel.data[i])
        );
      }
      return right(list);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

}