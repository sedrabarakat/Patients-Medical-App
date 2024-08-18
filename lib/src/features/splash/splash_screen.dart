import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/utils/string_manager.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/utils/values_manager.dart';

class SplashScreen extends StatefulWidget {
  final String pushRoute;
  const SplashScreen({super.key, required this.pushRoute});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToScreen();
    super.initState();
  }

  void navigateToScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.pushReplacement(widget.pushRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorsHelper.primary,
              ColorsHelper.primaryDark,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsManager.logo),
            const SizedBox(height: AppSize.s16),
            const Text(
              AppString.appName,
              style: StyleManager.fontRegular20White,
            )
          ],
        ),
      ),
    );
  }
}
