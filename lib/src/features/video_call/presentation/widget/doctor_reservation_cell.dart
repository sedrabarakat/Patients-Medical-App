import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/src/features/video_call/data/models/schedules_model.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/image_widget.dart';
import '../cubits/apis_cubit/schedule_list_cubit.dart';

Widget doctorReservationCell({
  required context,
  required bool is_reserved,
  required SchedulesModel listCell
}){
  ScheduleListCubit cubit=ScheduleListCubit.get(context);
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
                Text("${listCell.doctor.user.fullName}",style: StyleManager.fontBold20Black
                ),
                Text_Time(date: 'Nervous',text: 'Section'),
                Text_Time(date: " ${listCell.date}",text: 'Date'),
               Text_Time(date: listCell.from_min.substring(0, 5),text: 'From'),
               Text_Time(date: "     ${listCell.to_min.substring(0, 5)}",text: 'To'),
                if(is_reserved)
                  Already_Reserved()
              ],),
            SizedBox(width: (is_reserved)?4.w:28.w,),
            if(is_reserved)
              TextButton(onPressed: (){
               // cubit.deleteReserveSchedule(registeration_Id: 22);
              }, child: Text('Cancel'))
            else
              TextButton(onPressed: (){
                cubit.reserveSchedule(
                    online_guidance_schedule_id: listCell.id,
                    doctor_id: listCell.doctor_id,
                    patient_id: 61);
              }, child: Text('Reserve'))
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