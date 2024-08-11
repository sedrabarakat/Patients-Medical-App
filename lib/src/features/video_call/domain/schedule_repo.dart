import 'package:dartz/dartz.dart';

import '../../../../core/domain/error_handler/network_exceptions.dart';
import '../data/models/schedules_model.dart';

abstract class ScheduleRepo{

  Future<Either<NetworkExceptions,List<SchedulesModel>>>getSchedules();



}