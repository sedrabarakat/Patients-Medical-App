part of 'video_call_cubit.dart';

abstract class VideoCallState {}

class VideoCallInitialState extends VideoCallState {}

class EndCallstate extends VideoCallState {}

class MuteMicState extends VideoCallState {}

class DisableCameraState extends VideoCallState {}

class SwitchCameraState extends VideoCallState {}
