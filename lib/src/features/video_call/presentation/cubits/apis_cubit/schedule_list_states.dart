import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';

abstract class ScheduleListStates{}

 class ScheduleListInitState extends ScheduleListStates{}

class Loading_GetSchedules_State extends ScheduleListStates{}
class Success_GetSchedules_State extends ScheduleListStates{}
class Error_GetSchedules_State extends ScheduleListStates{}

class Loading_ReserveSchedule_State extends ScheduleListStates{}
class Success_ReserveSchedule_State extends ScheduleListStates{}
class Error_ReserveSchedule_State extends ScheduleListStates{
 static NetworkExceptions? error;
 Error_ReserveSchedule_State();

}


class Loading_Delete_ReserveSchedule_State extends ScheduleListStates{

}
class Success_Delete_ReserveSchedule_State extends ScheduleListStates{
 static String? message;
 Success_Delete_ReserveSchedule_State();
}
class Error_Delete_ReserveSchedule_State extends ScheduleListStates{
 static NetworkExceptions ?error;
 Error_Delete_ReserveSchedule_State();
}

class Success_AcceptCall_State extends ScheduleListStates{}
class Error_AcceptCall_State extends ScheduleListStates{}

class Success_DeclineCall_State extends ScheduleListStates{}
class Error_DeclineCall_State extends ScheduleListStates{}
