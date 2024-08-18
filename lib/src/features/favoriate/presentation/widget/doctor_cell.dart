import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/src/features/favoriate/presentation/cubit/fav_cubit.dart';
import 'package:patient_app/src/features/video_call/presentation/widget/doctor_reservation_cell.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/image_widget.dart';


Widget doctorCell({
  required context,
  required DoctorModel doctor
}){
  FavCubit favCubit=FavCubit.get(context);
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 15.w),
    child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 23.w,vertical: 10.h),
        height: 80.h,
        decoration: BoxDecoration(
            color: ColorsHelper.blueAccent.withOpacity(.2),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image_widget(image: null),
            SizedBox(width: 15.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(doctor.user.fullName,style: StyleManager.fontBold20Black
                ),
                Text_Data(text: 'Section', data: doctor.section!.sectionName)
              ],),
            SizedBox(width: 60.w,),
            IconButton(onPressed: (){
              favCubit.toggleFav(id: 2);
            }, icon: Icon(Icons.favorite,
            color: Colors.red.shade800,))
          ],
        )
    ),
  );
}

Widget favCon(){
  return Padding(
    padding: EdgeInsets.only(left: 18.w, top: 67.h, right: 18.w),
    child: Container(
      padding: EdgeInsets.only(left: 30.w),
      height: 130.h,
      width: 400.w,
      decoration: BoxDecoration(
          gradient: StyleManager.purbleGradients,
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20)),
      child: TextsColumn,
    ),
  );
}

Widget TextsColumn = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Your Favorite', style: StyleManager.fontBold20white),
    Text(
      'Doctors',
      style: StyleManager.fontBold20white,
    ),
  ],
);