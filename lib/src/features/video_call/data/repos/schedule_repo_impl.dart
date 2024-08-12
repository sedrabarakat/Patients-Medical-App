import 'package:dartz/dartz.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/video_call/data/models/schedules_model.dart';
import '../../../../../core/data/models/base_model.dart';
import '../../domain/schedule_repo.dart';
import '../remote/remote_schedule.dart';

class ScheduleRepoImpl extends ScheduleRepo {
  RemoteSchedule remoteSource;

  ScheduleRepoImpl(this.remoteSource);

  @override
  Future<Either<NetworkExceptions, List<SchedulesModel>>> getSchedules() async {
    try {
      List<SchedulesModel> list = [];
      BaseModel baseModel = await remoteSource.getOnlineSchedule();
      for (int i = 0; i < baseModel.data.length; i++) {
        list.add(SchedulesModel.fromJson(baseModel.data[i]));
      }
      return right(list);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, String>> reserveSchedule(
      {required int online_guidance_schedule_id}) async {
    try {
      BaseModel baseModel = await remoteSource.ReserveSchedule(
          online_guidance_schedule_id: online_guidance_schedule_id);
      return right(baseModel.message);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> DeleteReserveSchedule(
      {required int registeration_Id,
      }) async {
    try {
      BaseModel baseModel = await remoteSource.DeleteReserveSchedule(
          registeration_Id: registeration_Id);
      return right(baseModel.message);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> AcceptCall(
      {required String channelName,
      }) async {
    try {
      BaseModel baseModel = await remoteSource.AccepteCall(channelName: channelName);
      return right(baseModel.message);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> DeclineCall(
      {required String channelName,
      }) async {
    try {
      BaseModel baseModel = await remoteSource.DeclineCall(channelName: channelName);
      return right(baseModel.message);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
