import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/utils/string_manager.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/utils/values_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToLoginScreen();
    super.initState();
  }

  void navigateToLoginScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.pushReplacementNamed(AppRoute.login.name);
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
            const SizedBox(
              height: AppSize.s16,
            ),
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
