import 'package:flutter/cupertino.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/color_helper.dart';

Widget ClipPathContainer(){
  return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
        width: 600.w,
        height: 50.h,color:ColorsHelper.primary,
      ));
}