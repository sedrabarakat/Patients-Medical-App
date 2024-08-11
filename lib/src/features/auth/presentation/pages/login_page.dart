import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/utils/validator_manager.dart';
import 'package:patient_app/core/widgets/custom_progress_state_button.dart';
import 'package:patient_app/core/widgets/toast_bar.dart';
import '../../../../../core/utils/padding_manager.dart';
import '../../../../../core/widgets/custom_row_text_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

import '../cubit/auth_cubit.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RequestCodeSuccessState) {
          ToastBar.onSuccess(context, message: state.message, title: "Success");
          context.go(AppRouter.kVerify);
        } else if (state is RequestCodeErrorState) {
          ToastBar.onNetworkFailure(context, networkException: state.error);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: FloatingBubbles.alwaysRepeating(
                  noOfBubbles: 15,
                  colorsOfBubbles: const [
                    ColorsHelper.primary,
                    ColorsHelper.primaryDark,
                  ],
                  sizeFactor: 0.10,
                  opacity: 50,
                  paintingStyle: PaintingStyle.fill,
                  shape: BubbleShape.circle,
                  speed: BubbleSpeed.slow,
                ),
              ),
              Positioned.fill(
                child: Form(
                  key: BlocProvider.of<AuthCubit>(context).loginFormState,
                  child: ListView(
                    padding: AppPadding.screenPadding,
                    children: [
                      const Gap(40),
                      Center(
                        child: Image.asset(
                          AssetsManager.login,
                          height: DimensionsHelper.screenHeight(context) / 3,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        AppLocalizations.of(context)!.loginWelcome,
                        style: StyleManager.fontBold24Black,
                      ),
                      Text(
                        AppLocalizations.of(context)!.loginSubWelcome,
                        style: StyleManager.fontRegular14grey,
                      ),
                      const Gap(50),
                      CustomTextField(
                        valid: (value) =>
                            ValidatorManager().validatePhone(value!),
                        labelText: AppLocalizations.of(context)!.phoneNumber,
                        iconData: Icons.phone_android,
                        myController:
                            BlocProvider.of<AuthCubit>(context).phoneController,
                        hintText: AppLocalizations.of(context)!.phoneHint,
                        keyboardType: TextInputType.phone,
                      ),
                      // SizedBox(height: MediaQuery.of(context).size.height/20,),
                      const Gap(40),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return CustomStateButton(
                            onPressed: () async {
                              await BlocProvider.of<AuthCubit>(context)
                                  .requestCode();
                            },
                            currentState: BlocProvider.of<AuthCubit>(context)
                                .requestCodeButtonState,
                            label: AppLocalizations.of(context)!.login,
                          );
                        },
                      ),

                      const Gap(15),
                      CustomRowTextButton(
                        text: AppLocalizations.of(context)!.dontHaveAccount,
                        btnText: AppLocalizations.of(context)!.signup,
                        onTap: () {
                          context.pushReplacement(AppRouter.kRegister);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
