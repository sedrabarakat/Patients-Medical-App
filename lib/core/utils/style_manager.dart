/* Here goes the text styles */

import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/color_manager.dart';

abstract class StyleManager {
    static const TextStyle fontRegular20White = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: ColorsManager.white
  );

  static const TextStyle fontRegular16Black = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: ColorsManager.black
  );

  static const TextStyle fontRegular14grey = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorsManager.grey
  );

  static const TextStyle fontRegular14Black = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.black
    );

  static const TextStyle fontRegular14Primary = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.primary
    );

  static const TextStyle fontBold24 =  TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins-bold',
      color: ColorsManager.black,
  );
  static const TextStyle fontBold40 = TextStyle(
    fontFamily: 'Poppins-bold',
    color: ColorsManager.white,
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
  );

}
