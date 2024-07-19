import 'package:flutter/material.dart';

class DimensionsHelper {
  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;
  static double heightPercentage(BuildContext context, double percentage) =>
      screenHeight(context) * percentage / 100;
  static double widthPercentage(BuildContext context, double percentage) =>
      screenWidth(context) * percentage / 100;
  static double fontSize(BuildContext context, double percentage) =>
      screenHeight(context) * percentage / 100;
  static double radius(BuildContext context, double percentage) =>
      screenHeight(context) * percentage / 100;
}

class AppSize {
  static const  s1_5 = 1.5;
  static const  s2_5 = 2.5;
  static const size10 = 10.0;
  static const size15 = 15.0;
  static const size20 = 20.0;
  static const size25 = 25.0;
  static const size30 = 30.0;
  static const size32 = 32.0;
  static const size40 = 40.0;
  static const size45 = 45.0;
  static const size50 = 50.0;
  static const size60 = 60.0;
  static const size70 = 70.0;
  static const size80 = 80.0;
  static const size100 = 100.0;
  static const size140 = 140.0;

  // padding
  static const padding5 = 5.0;
  static const padding10 = 10.0;
  static const padding15 = 15.0;
  static const padding20 = 20.0;
  static const padding25 = 25.0;
  static const padding30 = 30.0;
  static const padding40 = 40.0;
  static const padding60 = 60.0;
  static const screenPadding = padding20;
}
