import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/image_widget.dart';


Widget doctorCell({
  required context,
}){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 15.w),
    child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        height: 76.h,
        decoration: BoxDecoration(
            color: ColorsHelper.tealLightDark.withOpacity(.2),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image_widget(image: null),
            SizedBox(width: 15.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("David back",style: StyleManager.fontBold20Black
                ),
              ],),
            SizedBox(width: 60.w,),
            IconButton(onPressed: (){}, icon: Icon(Icons.favorite,
            color: Colors.red.shade800,))
          ],
        )
    ),
  );
}