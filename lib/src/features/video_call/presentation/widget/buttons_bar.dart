import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_cubit.dart';
import '../cubits/agora/video_call_cubit.dart';

Widget buttonsBar({
  required VideoCallCubit cubit,
  required context
}){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding:  EdgeInsets.only(
        bottom: 50.h,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.4),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed:
              cubit
                  .muteMic,
              icon: Icon(
                cubit
                    .Mute
                    ? Icons.mic_off
                    : Icons.mic,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed:
              ()async{
                cubit.endCall;
                await PusherCubit.get(context).DeclineCall();
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              icon: const Icon(
                Icons.call_end,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed:
              cubit
                  .changeCamera,
              icon: const Icon(
                Icons.switch_camera,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed:
              cubit
                  .disableCamera,
              icon: Icon(
                cubit
                    .Camera_On
                    ? Icons.videocam
                    : Icons.videocam_off,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}