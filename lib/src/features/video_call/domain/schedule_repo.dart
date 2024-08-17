import 'package:dartz/dartz.dart';

import '../../../../core/domain/error_handler/network_exceptions.dart';
import '../data/models/schedules_model.dart';

abstract class ScheduleRepo{

  Future<Either<NetworkExceptions,List<SchedulesModel>>>getSchedules();

  Future<Either<NetworkExceptions, String>> reserveSchedule(
      {required int online_guidance_schedule_id});

  Future<Either<NetworkExceptions, String>> DeleteReserveSchedule(
      {required int registeration_Id,
      });



}