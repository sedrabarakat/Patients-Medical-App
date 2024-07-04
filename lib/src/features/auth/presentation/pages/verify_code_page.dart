import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/utils/color_manager.dart';
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
                  content: Lottie.asset('assets/lottie/success.json'),
                );
              },
            );
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(60),
                    const Text(
                      AppString.verifyCode,
                      style: StyleManager.fontBold24Black,
                    ),
                    const Gap(70),
                    const Text(
                      AppString.enterVerifyCode,
                      style: StyleManager.fontRegular16Black,
                    ),
                    const Gap(20),
                    OtpTextField(
                      fieldWidth: DimensionsHelper.screenWidth(context) / 8,
                      numberOfFields: 6,
                      borderColor: ColorsManager.primary,
                      focusedBorderColor: ColorsManager.primary,
                      enabledBorderColor: ColorsManager.grey,
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
