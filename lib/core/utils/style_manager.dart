/* Here goes the text styles */

import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/color_manager.dart';

abstract class StyleManager {
  /*>>>>>>>>>> Extra Bold <<<<<<<<<<*/
  static TextStyle fontExtraBold26Black = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 26,
    color: ColorsManager.black,
  );
  static TextStyle fontExtraBold14Black = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: ColorsManager.black,
  );
  static TextStyle fontExtraBold28Primary = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 28,
    color: ColorsManager.primary,
  );
  static TextStyle fontExtraBold14White = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: ColorsManager.white,
  );

  static TextStyle fontExtraBold20Black = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: ColorsManager.black,
  );

  /*>>>>>>>>>> Bold <<<<<<<<<<*/
  static const TextStyle fontBold40White = TextStyle(
    fontFamily: 'Poppins-bold',
    color: ColorsManager.white,
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle fontBold24Black = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins-bold',
    color: ColorsManager.black,
  );
  static TextStyle fontBold16Black = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsManager.black,
  );
  /*>>>>>>>>>> Medium <<<<<<<<<<*/
  static TextStyle fontMedium16White = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorsManager.white,
  );

  /*>>>>>>>>>> Regular <<<<<<<<<<*/
  static const TextStyle fontRegular20White = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
  static const TextStyle fontRegular16primary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorsManager.primary,
  );
  static const TextStyle fontRegular16Black = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorsManager.black,
  );

  static const TextStyle fontRegular14grey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsManager.lighGrey,
  );

  static const TextStyle fontRegular14Black = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsManager.black,
  );

  static const TextStyle fontRegular12Black = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorsManager.black,
  );
  static const TextStyle fontRegular14Primary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsManager.primary,
  );
}
