import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/widgets/toast_bar.dart';
import 'package:patient_app/src/features/auth/presentation/pages/widgets/resend_count_down_widget.dart';

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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RequestCodeSuccessState) {
          ToastBar.onSuccess(context, message: state.message, title: 'Success');
        } else if (state is RequestCodeErrorState) {
          ToastBar.onNetworkFailure(context, networkException: state.error);
        } else if (state is VerifyCodeErrorState) {
          ToastBar.onNetworkFailure(context, networkException: state.error);
        } else if (state is VerifyCodeSuccessState) {
          ToastBar.onSuccess(context,
              message: "Welcome back ${state.userData.fullName}",
              title: "Success");
          context.go(AppRouter.kBottomNavigationScreen);
        }
      },
      child: Scaffold(
        body: Form(
          key: BlocProvider.of<AuthCubit>(context).formStateVerify,
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
                Text(
                  BlocProvider.of<AuthCubit>(context).phoneController.text,
                  style: StyleManager.fontRegular14Primary,
                ),
                const Gap(20),
                OtpTextField(
                  fieldWidth: DimensionsHelper.widthPercentage(context, 10),
                  fieldHeight: DimensionsHelper.heightPercentage(context, 10),
                  numberOfFields: 6,
                  borderColor: ColorsHelper.primary,
                  focusedBorderColor: ColorsHelper.primary,
                  enabledBorderColor: ColorsHelper.grey,
                  borderRadius: BorderRadius.circular(AppSize.size15),
                  showFieldAsBox: true,
                  filled: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) async {
                    BlocProvider.of<AuthCubit>(context).otpCode =
                        verificationCode;
                    await BlocProvider.of<AuthCubit>(context).verifyCode();
                  },
                ),
                const Gap(20),
                BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                  return ResendCountDown(
                    secondsToWait: Duration(
                        seconds:
                            BlocProvider.of<AuthCubit>(context).waitSeconds),
                    onResendPressed: () {
                      BlocProvider.of<AuthCubit>(context).requestCode();
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
