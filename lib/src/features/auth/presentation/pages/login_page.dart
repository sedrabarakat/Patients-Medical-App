import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/string_manager.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/utils/validator_manager.dart';
import '../../../../../core/utils/padding_manager.dart';
import '../../../../../core/widgets/custom_row_text_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../cubit/auth_cubit.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: Form(
              key: cubit.formState,
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
                  const Text(
                    AppString.loginWelcome,
                    style: StyleManager.fontBold24Black,
                  ),
                  const Text(AppString.loginSubWelcome,
                      style: StyleManager.fontRegular14grey),
                  const Gap(50),
                  CustomTextField(
                    valid: (value) => ValidatorManager().validatePhone(value!),
                    labelText: AppString.textFieldPhoneLabel,
                    iconData: Icons.phone_android,
                    myController: cubit.phoneController,
                    hintText: AppString.textFieldPhoneHint,
                    isNumber: true,
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height/20,),
                  const Gap(40),
                  CustomButton(
                    onPressed: () {
                      cubit.login();
                    },
                    label: AppString.buttonLoginText,
                  ),
                  const Gap(15),
                  CustomRowTextButton(
                    text: AppString.doNotHaveAnAccount,
                    btnText: AppString.createAccount,
                    onTap: () {
                      goRouter.pushReplacementNamed(AppRoute.register.name);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
