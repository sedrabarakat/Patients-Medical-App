import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:patient_app/core/helper/color_helper.dart';

import '../../../../../core/utils/style_manager.dart';

Widget remoteVideo({
  required var remoteUid,
  required RtcEngine engine,
  required String channel_name,
}) {
  if (remoteUid != null) {
    return AgoraVideoView(
      controller: VideoViewController.remote(
        rtcEngine: engine,
        canvas: VideoCanvas(uid: remoteUid),
        connection: RtcConnection(channelId: channel_name),
      ),
    );
  } else {
    return Padding(
      padding: EdgeInsets.only(top: 300.h, left: 100.w, right: 100.w),
      child: Column(
        children: [
          Lottie.asset("assets/animation/chats.json"),
          Text(
            "Please wait the doctor",
            style: StyleManager.fontExtraBold20Black
                .copyWith(color: ColorsHelper.blue),
          )
        ],
      ),
    );
  }
}
