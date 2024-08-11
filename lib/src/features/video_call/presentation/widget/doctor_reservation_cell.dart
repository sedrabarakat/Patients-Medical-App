import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/src/features/video_call/data/models/schedules_model.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/image_widget.dart';

Widget doctorReservationCell({
  required context,
  required bool is_reserved,
  required SchedulesModel listCell
}){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 10.w),
    child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        height:(is_reserved)?150.h:135.h,
        decoration: BoxDecoration(
            color: ColorsHelper.tealLightDark.withOpacity(.2),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image_widget(image: null),
            SizedBox(width: 20.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${listCell}",style: StyleManager.fontBold20Black
                ),
                Text_Time(date: 'Nervous',text: 'Section'),
                Text_Time(date: '2002-22-2',text: 'Date'),
               Text_Time(date: '00:00',text: 'From'),
               Text_Time(date: '12:12',text: 'To'),
                if(is_reserved)
                  Already_Reserved()
              ],),
            SizedBox(width: (is_reserved)?4.w:40.w,),
            if(is_reserved)
              TextButton(onPressed: (){}, child: Text('Cancel'))
            else
              TextButton(onPressed: (){}, child: Text('Reserve'))
          ],
        )
    ),
  );
}


Widget Text_Time({
  required String text,
  required String date
}){
  return Row(children: [

    Text("$text : ",style: TextStyle(
        fontSize: 15.sp,fontWeight: FontWeight.bold,
        color: ColorsHelper.primary,
        fontFamily: 'Lobster-Regular'
    ),),
    Text("$date"),
  ],);
}

Widget Already_Reserved(){
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('you have already reserved',
      style: StyleManager.fontRegular12Primary),
    Text('that appointment', style: StyleManager.fontRegular12Primary)
  ],);
}