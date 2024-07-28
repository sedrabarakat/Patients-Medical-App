import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patient_app/core/helper/color_helper.dart';

/* The Application Theme */
class ThemeManager {
  static ThemeData myTheme = ThemeData(
    applyElevationOverlayColor: false,
    fontFamily: 'Poppins',
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsHelper.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsHelper.white,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorsHelper.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    primaryColor: ColorsHelper.primary,
  );
}
