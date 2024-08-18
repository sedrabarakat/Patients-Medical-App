/* Here goes the text styles */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/helper/color_helper.dart';

abstract class StyleManager {
  /*>>>>>>>>>> Extra Bold <<<<<<<<<<*/
  static TextStyle fontExtraBold26Black = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 26,
    color: ColorsHelper.black,
  );
  static TextStyle fontExtraBold14Black = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: ColorsHelper.black,
  );
  static TextStyle fontExtraBold28Primary = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 28,
    color: ColorsHelper.primary,
  );
  static TextStyle fontExtraBold14White = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: ColorsHelper.white,
  );

  static TextStyle fontExtraBold20Black = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: ColorsHelper.black,
  );

  /*>>>>>>>>>> Bold <<<<<<<<<<*/
  static  TextStyle fontBold20white = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins-bold',
    color: ColorsHelper.black,
  );

  static TextStyle fontBold60 = TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.bold,
      color: ColorsHelper.white,
      fontFamily: 'Lobster-Regular');
  static const TextStyle fontBold40White = TextStyle(
    fontFamily: 'Poppins-bold',
    color: ColorsHelper.white,
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle fontBold24Black = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins-bold',
    color: ColorsHelper.black,
  );
  static const TextStyle fontBold20Black = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins-bold',
    color: ColorsHelper.black,
  );
  static TextStyle fontBold18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: ColorsHelper.black,
  );
  static TextStyle fontBold16Black = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsHelper.black,
  );
  static TextStyle font14Bold= TextStyle(
    fontSize: 14.sp,fontWeight: FontWeight.bold,
    color: ColorsHelper.indigo,
    fontFamily: 'Lobster-Regular',
    overflow: TextOverflow.ellipsis,
  );
  /*>>>>>>>>>> Medium <<<<<<<<<<*/
  static TextStyle fontMedium18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );
  static TextStyle fontMedium16White = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorsHelper.white,
  );
  static TextStyle fontMedium13 = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: ColorsHelper.lighGrey,
  );
  static TextStyle fontMedium14 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorsHelper.white,
  );

  /*>>>>>>>>>> Regular <<<<<<<<<<*/
  static const TextStyle fontRegular20White = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.white,
  );
  static const TextStyle fontRegular18primary = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.grey,
  );
  static const TextStyle fontRegular16primary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.primary,
  );
  static const TextStyle fontRegular16Black = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.black,
  );

  static const TextStyle fontRegular14grey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.lighGrey,
  );

  static const TextStyle fontRegular14Black = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.black,
  );

  static TextStyle fontRegular14P = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.black54,

  );
  static const TextStyle fontRegular12Black = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.black,
  );
  static TextStyle fontRegular12Primary = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.indigo.shade700,
  );
  static const TextStyle fontRegular14Primary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.primary,
  );

  ///Container Decoration
  static const BoxDecoration Background_Call = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        ColorsHelper.lightBlue,
        ColorsHelper.greenishBlue,
        ColorsHelper.Skyblue,
        ColorsHelper.blue,
        ColorsHelper.blueLight,
        ColorsHelper.blueMov,
        ColorsHelper.blueDark,
        ColorsHelper.blueDarkest,
      ],
    ),
  );

  static BoxDecoration Circle_Shape({required Color color}) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    );
  }
  ///boxshadows
  static BoxShadow shadow =BoxShadow(
    color: Colors.black.withOpacity(0.25),
    spreadRadius: 3,
    blurRadius: 10,
    offset: Offset(3, 7),
  );

  static BoxDecoration GryShadow20=BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 3,
          blurRadius: 10,
          offset: Offset(3, 7),
        ),
      ],
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(20));

  ///gardinates
  static LinearGradient indigoGradients= LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        ColorsHelper.primary,
        Colors.indigoAccent.withOpacity(.9),
        Colors.indigoAccent.withOpacity(.8),
        Colors.indigoAccent.withOpacity(.7),
      ]);

  static LinearGradient purbleGradients=LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [

        Colors.blueAccent.withOpacity(.4),
        Colors.blueAccent.withOpacity(.3),
        Colors.blueAccent.withOpacity(.2),
      ]);
}
