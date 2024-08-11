import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/style_manager.dart';

Widget Image_widget({
  required var image,

}){
  return Container(
      width: 55.w,
      decoration: StyleManager.Circle_Shape(color: Colors.black26),
      child: (image!=null)?SizedBox():Image.asset(AssetsManager.user,fit: BoxFit.contain)
  );
}