part of 'video_call_cubit.dart';

abstract class VideoCallState {}

class VideoCallInitialState extends VideoCallState {}

class EndCallstate extends VideoCallState {}

class MuteMicState extends VideoCallState {}

class DisableCameraState extends VideoCallState {}

class SwitchCameraState extends VideoCallState {}

class InitializedEngineState extends VideoCallState {}

class Success_JoinChannelState extends VideoCallState {}

class Error_JoinChannelState extends VideoCallState {}

class LocalUserJoined extends VideoCallState {}

class RemoteUserJoined extends VideoCallState{}

class RemoteUserLeave extends VideoCallState{}
