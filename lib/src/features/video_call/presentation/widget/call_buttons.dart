import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../cubits/pusher/pusher_cubit.dart';

Widget callButtons({
  required PusherCubit cubit,
  required context
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 100.w,
      ),
      InkWell(
        onTap: cubit.DeclineCall,
        child: Image.asset(
          "assets/images/end-call-icon.png",
          width: 300.w,color: CupertinoColors.black,
        ),
      ),
      SizedBox(
        width: 300.w,
      ),
      InkWell(
        onTap: (){
          cubit.AcceptCall(eventModel: cubit.CubitEventModel!,context: context);
        },
          child: Lottie.asset(AssetsManager.GreenRing,width: 160.h)),
    ],
  );
}
