import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/string_manager.dart';
import 'package:patient_app/core/utils/color_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/utils/validator_manager.dart';
import '../../../../../core/utils/padding_manager.dart';
import '../../../../../core/widgets/custom_row_text_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../cubit/auth_cubit.dart';
import 'package:gap/gap.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpFailureState) {
          } else if (state is SignUpSuccessState) {
            goRouter.pushReplacementNamed(AppRoute.home.name);
          }
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: Form(
              key: cubit.formState,
              child: ListView(
                padding: AppPadding.screenPadding,
                children: [
                  const Gap(60),
                  const Text(
                    AppString.signUp,
                    style: StyleManager.fontBold24Black,
                  ),
                  const Gap(30),
                  CustomTextField(
                    valid: (value) => ValidatorManager().validateName(value!),
                    labelText: AppString.textFieldFullNameLabel,
                    iconData: Icons.drive_file_rename_outline,
                    myController: cubit.fullNameController,
                    hintText: AppString.textFieldFullNameHint,
                    isNumber: false,
                  ),
                  const Gap(15),
                  CustomTextField(
                    valid: (value) => ValidatorManager().validatePhone(value!),
                    labelText: AppString.textFieldPhoneLabel,
                    iconData: Icons.phone,
                    myController: cubit.phoneController,
                    hintText: AppString.textFieldPhoneHint,
                    isNumber: true,
                  ),
                  const Gap(15),
                  CustomTextField(
                    valid: (value) => ValidatorManager().validateName(value!),
                    onTapIcon: () => cubit.toSelectDate(context),
                    labelText: AppString.textFieldBirthDateLabel,
                    iconData: Icons.calendar_today,
                    myController: cubit.dateController,
                    hintText: AppString.textFieldBirthDateHint,
                    isNumber: false,
                  ),
                  const Gap(15),
                  CustomTextField(
                    valid: (value) => ValidatorManager().validateName(value!),
                    labelText: AppString.textFieldProfessionLabel,
                    iconData: Icons.work_outline_outlined,
                    myController: cubit.professionController,
                    hintText: AppString.textFieldProfessionHint,
                    isNumber: false,
                  ),
                  const Gap(15),
                  CustomTextField(
                    valid: (value) => ValidatorManager().validateName(value!),
                    labelText: AppString.textFieldHabitsLabel,
                    iconData: Icons.self_improvement,
                    myController: cubit.habitsController,
                    hintText: AppString.textFieldHabitsHint,
                    isNumber: false,
                  ),
                  const Gap(15),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'select material state',
                      hintStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 35,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: DimensionsHelper.screenHeight(context) / 100,
                        horizontal: DimensionsHelper.screenWidth(context) / 15,
                      ),
                      labelText: AppString.textFieldMaritalStatusLabel,
                      floatingLabelStyle: StyleManager.fontRegular14Primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: ColorsManager.primary,
                          width: 2,
                        ),
                      ),
                    ),
                    value: cubit.selectedMaritalStatus,
                    items: cubit.maritalStatus.map((String maritalStatus) {
                      return DropdownMenuItem<String>(
                        value: maritalStatus,
                        child: Text(maritalStatus),
                      );
                    }).toList(),
                    onChanged: (value) {
                      cubit.selectHabit(value!);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value == 'None') {
                        return AppString.textFieldMaritalStatusHint;
                      }
                      return null;
                    },
                  ),
                  const Gap(15),
                  cubit.selectedMaritalStatus == 'Married'
                      ? CustomTextField(
                          valid: (value) =>
                              ValidatorManager().validatePhone(value!),
                          labelText: AppString.textFieldChildrenNumLabel,
                          iconData: Icons.child_care_outlined,
                          myController: cubit.childrenNumberController,
                          hintText: AppString.textFieldChildrenNumHint,
                          isNumber: true,
                        )
                      : const Gap(0),
                  // const Gap(10),
                  Row(
                    children: [
                      BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                        return Checkbox(
                          value: cubit.diabetes,
                          onChanged: (bool? value) {
                            cubit.toggleDiabetes();
                          },
                          activeColor: ColorsManager.primary,
                        );
                      }),
                      const Text(AppString.diabetes,
                          style: StyleManager.fontRegular14Black),
                    ],
                  ),
                  Row(
                    children: [
                      BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                        return Checkbox(
                          value: cubit.bloodPressure,
                          onChanged: (bool? value) {
                            cubit.toggleBloodPressure();
                          },
                          activeColor: ColorsManager.primary,
                        );
                      }),
                      const Text(AppString.bloodPressure,
                          style: StyleManager.fontRegular14Black),
                    ],
                  ),
                  const Gap(20),
                  CustomButton(
                    onPressed: () {
                      cubit.login();
                    },
                    label: AppString.buttonSignUpText,
                  ),
                  CustomRowTextButton(
                    text: AppString.alreadyHaveAccount,
                    btnText: AppString.buttonLoginText,
                    onTap: () {
                      goRouter.pushReplacementNamed(AppRoute.login.name);
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
