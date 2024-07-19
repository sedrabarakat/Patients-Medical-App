import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
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
                    valid: (value) => ValidatorManager().validatePhone(value!),
                    labelText: AppLocalizations.of(context)!.phoneNumber,
                    iconData: Icons.phone_android,
                    myController: cubit.phoneController,
                    hintText: AppLocalizations.of(context)!.phoneHint,
                    isNumber: true,
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height/20,),
                  const Gap(40),
                  CustomButton(
                    onPressed: () {
                      cubit.login();
                    },
                    label: AppLocalizations.of(context)!.login,
                  ),
                  const Gap(15),
                  CustomRowTextButton(
                    text: AppLocalizations.of(context)!.dontHaveAccount,
                    btnText: AppLocalizations.of(context)!.signup,
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
