import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/domain/urls/app_url.dart';
part 'video_call_state.dart';


class VideoCallCubit extends Cubit<VideoCallState> {

  int uid = 0; //UID of the local user
  var RemoteUid;

  bool localUserJoined = false;

  RtcEngine ? engine;

  ///
  bool Mute=false;
  bool MuteAll=false;
  bool Camera_On=true;

  VideoCallCubit() : super(VideoCallInitialState());

  static VideoCallCubit get(context)=>BlocProvider.of(context);

  Future<void> initAgora({
    required String token,
    required String channel,
    required int RemoteUid
})async{
    await [Permission.microphone, Permission.camera].request();
    engine= createAgoraRtcEngine();

    this.RemoteUid=RemoteUid;

    await engine!.initialize(const RtcEngineContext(
      appId: AppID_Agora,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));
    emit(InitializedEngineState());

    engine!.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          localUserJoined = true;
          print("event $localUserJoined");
          emit(LocalUserJoined());
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          RemoteUid = remoteUid;
          emit(RemoteUserJoined());
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          this.RemoteUid=null;
          emit(RemoteUserLeave());
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );
    await engine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine!.enableVideo();
    await engine!.startPreview();
    await engine!.joinChannel(
        token: token,
        channelId: channel,
        uid: uid,
        options: const ChannelMediaOptions());
    emit(Success_JoinChannelState());
  }

  void endCall() async {
    engine!.leaveChannel();
    engine!.release();
    emit(EndCallstate());
  }

  ///bottom buttons

  void muteMic() async {
    Mute=!Mute;
    if(Mute==false)
      engine!.muteLocalAudioStream(Mute);
    else
      engine!.enableLocalAudio(Mute);
    emit(MuteMicState());
  }

  void muteAll() async {
    MuteAll=!MuteAll;
    engine!.muteAllRemoteAudioStreams(MuteAll);
    emit(MuteMicState());
  }

  void disableCamera() async {
    Camera_On=!Camera_On;
    if(Camera_On==true)
      engine!.enableLocalVideo(Camera_On);
    else
      engine!.disableVideo();
    emit(DisableCameraState());
  }

  void changeCamera() async {
    try {
      await engine!.switchCamera();
      print('Camera switched');
    } catch (e) {
      print('Error switching camera: $e');
    }
    emit(SwitchCameraState());
  }

}
/*
Future<void> initAgora() async {
  // retrieve permissions
  await [Permission.microphone, Permission.camera].request();

  //create the engine
  _engine = createAgoraRtcEngine();
  await _engine.initialize(const RtcEngineContext(
    appId: appId,
    channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
  ));

  _engine.registerEventHandler(
    RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        debugPrint("local user ${connection.localUid} joined");
        setState(() {
          _localUserJoined = true;
        });
      },
      onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        debugPrint("remote user $remoteUid joined");
        setState(() {
          _remoteUid = remoteUid;
        });
      },
      onUserOffline: (RtcConnection connection, int remoteUid,
          UserOfflineReasonType reason) {
        debugPrint("remote user $remoteUid left channel");
        setState(() {
          _remoteUid = null;
        });
      },
      onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
        debugPrint(
            '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
      },
    ),
  );

  await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
  await _engine.enableVideo();
  await _engine.startPreview();

  await _engine.joinChannel(
    token: token,
    channelId: channel_name,
    uid: 0,
    options: const ChannelMediaOptions(),
  );
}*/
