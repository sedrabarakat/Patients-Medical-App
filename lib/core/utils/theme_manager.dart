import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patient_app/core/utils/color_manager.dart';

/* The Application Theme */
class ThemeManager {
  static ThemeData myTheme = ThemeData(
    applyElevationOverlayColor: false,
    fontFamily: 'Poppins',
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.white,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorsManager.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    primaryColor: ColorsManager.primary,
  );
}
