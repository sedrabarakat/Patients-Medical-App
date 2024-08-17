import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../cubits/pusher/pusher_cubit.dart';

Widget callButtons({
  required context,
  required AssetsAudioPlayer assetsAudioPlayer
}) {
  PusherCubit cubit=PusherCubit.get(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 40.w,
      ),
      InkWell(
        onTap: (){
          assetsAudioPlayer.stop();
          cubit.DeclineCall();
        },
        child: Image.asset(
          "assets/images/end-call-icon.png",
          width: 70.w,color: CupertinoColors.black,
        ),
      ),
      SizedBox(
        width: 80.w,
      ),
      InkWell(
        onTap: (){
          assetsAudioPlayer.stop();
          cubit.AcceptCall(context: context);
        },
          child: Lottie.asset(AssetsManager.GreenRing,width: 130.w)),
    ],
  );
}
