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
  required SchedulesModel listCell
}){
  ScheduleListCubit cubit=ScheduleListCubit.get(context);
  bool is_reserved= (listCell.my_registeration_id!=null)?true:false;

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 10.w),
    child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        height:(is_reserved)?170.h:135.h,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listCell.doctor.user.fullName,style: StyleManager.fontBold20Black
                ),
                Text_Data(data: listCell.doctor.section!.sectionName,text: 'Section'),
                Text_Data(data: "   ${listCell.date}",text: 'Date'),
               Text_Data(data:"   ${listCell.from_min.substring(0, 5)}",text: 'From'),
               Text_Data(data: "       ${listCell.to_min.substring(0, 5)}",text: 'To'),
                if(is_reserved)
                  Already_Reserved()
              ],),
            SizedBox(width: (is_reserved)?4.w:15.w,),
            if(is_reserved)
              TextButton(onPressed: (){
                cubit.deleteReserveSchedule(registeration_Id: listCell.my_registeration_id!);
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

Widget Text_Data({
  required String text,
  required String data,
  TextStyle ?textstyle
}){

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text("$text : ",style: (textstyle!=null)?textstyle:StyleManager.font14Bold,),
      Text("$data",style: StyleManager.fontRegular14P,),
    ],);
}



Widget Already_Reserved(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('you have already reserved',
      style: StyleManager.fontRegular12Primary),
    Text('that appointment', style: StyleManager.fontRegular12Primary)
  ],);
}