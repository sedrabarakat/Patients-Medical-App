import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:patient_app/core/routing/app_router.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/helper/dimension_manager.dart';
import '../cubit/auth_cubit.dart';
import 'package:patient_app/core/utils/string_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is VerifyCodeSuccessState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Lottie.asset(AssetsManager.success),
                );
              },
            );
            Future.delayed(const Duration(seconds: 2), () {
              context.pushReplacement(AppRouter.kBottomNavigationScreen);
            });
          } else if (state is VerifyCodeFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return Scaffold(
            body: Form(
              key: cubit.formStateVerify,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.screenPadding,
                  vertical: AppSize.screenPadding,
                ), // DimensionsHelper.screenPadding,
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Gap(60),
                    SvgPicture.asset(
                      AssetsManager.verificationCode,
                      height: DimensionsHelper.heightPercentage(context, 30),
                    ),
                    Gap(DimensionsHelper.heightPercentage(context, 10)),
                    Text(
                      AppString.verifyCode,
                      style: StyleManager.fontExtraBold28Primary,
                    ),
                    Gap(DimensionsHelper.heightPercentage(context, 1)),
                    const Text(
                      AppString.enterVerifyCode,
                      style: StyleManager.fontRegular14grey,
                    ),
                    const Text(
                      '0999999999',
                      style: StyleManager.fontRegular14Primary,
                    ),
                    const Gap(20),
                    OtpTextField(
                      fieldWidth: DimensionsHelper.widthPercentage(context, 10),
                      fieldHeight:
                          DimensionsHelper.heightPercentage(context, 10),
                      numberOfFields: 6,
                      borderColor: ColorsHelper.primary,
                      focusedBorderColor: ColorsHelper.primary,
                      enabledBorderColor: ColorsHelper.grey,
                      borderRadius: BorderRadius.circular(AppSize.size15),
                      showFieldAsBox: true,
                      filled: true,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        cubit.verifyCode(verificationCode);
                      },
                    ),
                    const Gap(20),
                    if (state is VerifyCodeFailureState) ...[
                      Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
