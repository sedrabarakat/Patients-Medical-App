import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/rtc_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'video_call_state.dart';

const appId = "d6e2f859988d44ff9c9ad739598f1dfc";
String channelName = 'newnew';
String token = "token";
int uid = 0; //UID of the local user

class VideoCallCubit extends Cubit<VideoCallState> {
  VideoCallCubit() : super(VideoCallInitialState());

  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: appId,
      channelName: channelName,
      username: "user",
      uid: uid,
      // tempToken: token
    ),
  );
  bool get isMuted => client.sessionController.value.isLocalUserMuted;
  bool get isCameraDisabled =>
      client.sessionController.value.isLocalVideoDisabled;

  void initAgora() async {
    await client.initialize();
  }

  void endCall() async {
    await client.release();
    emit(EndCallstate());
  }

  void muteMic() async {
    await toggleMute(
      sessionController: client.sessionController,
    );
    emit(MuteMicState());
  }

  void disableCamera() async {
    await toggleCamera(
      sessionController: client.sessionController,
    );
    emit(DisableCameraState());
  }

  void changeCamera() async {
    await switchCamera(
      sessionController: client.sessionController,
    );
    emit(SwitchCameraState());
  }
}
