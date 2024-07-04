import 'package:flutter/material.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/utils/theme_manager.dart';

class PatientApp extends StatelessWidget {
  const PatientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.myTheme,
      routerConfig:  goRouter ,
    );
  }
}
