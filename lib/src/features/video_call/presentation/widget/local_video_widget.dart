import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/agora/video_call_cubit.dart';

Widget localVideo({required VideoCallCubit cubit}) {
  return Align(
    alignment: Alignment.topLeft,
    child: (cubit.Camera_On)
        ? cubit.localUserJoined
            ? SizedBox(
                width: 800.w,
                height: 250.h,
                child: AgoraVideoView(
                  controller: VideoViewController(
                    rtcEngine: cubit.engine!,
                    canvas: const VideoCanvas(uid: 0),
                  ),
                ),
              )
            : Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 100.w, vertical: 80.h),
                child: const CircularProgressIndicator(),
              )
        :  Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 5.w
            )
          ),
          child: Lottie.asset("assets/animation/animated_person.json",
          height: 250.h, fit: BoxFit.cover),
        ),

  );
}
