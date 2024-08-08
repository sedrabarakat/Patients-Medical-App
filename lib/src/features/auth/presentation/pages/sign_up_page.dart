import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/utils/string_manager.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/utils/validator_manager.dart';
import 'package:patient_app/core/widgets/custom_progress_state_button.dart';
import 'package:patient_app/core/widgets/toast_bar.dart';
import 'package:patient_app/src/features/auth/presentation/pages/widgets/custom_check_box.dart';
import 'package:patient_app/src/features/auth/presentation/pages/widgets/custom_drop_down_button.dart';
import 'package:patient_app/src/features/auth/presentation/pages/widgets/profile_picture.dart';
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
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          ToastBar.onSuccess(context,
              message: "Success", title: "Signed up successfully");
          context.pushReplacement(AppRouter.kLogin);
        } else if (state is SignUpFailureState) {
          ToastBar.onNetworkFailure(context, networkException: state.error);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
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
                  key: cubit.formState,
                  child: ListView(
                    padding: AppPadding.screenPadding,
                    children: [
                      const Gap(30),
                      Text(
                        AppLocalizations.of(context)!.signup,
                        style: StyleManager.fontBold24Black,
                      ),
                      const ProfilePicture(),
                      const Gap(30),
                      CustomTextField(
                        valid: (value) =>
                            ValidatorManager().validateName(value!),
                        labelText: AppLocalizations.of(context)!.fullName,
                        iconData: Icons.drive_file_rename_outline,
                        myController: cubit.fullNameController,
                        hintText: AppLocalizations.of(context)!.fullNameHint,
                      ),
                      const Gap(15),
                      CustomTextField(
                        valid: (value) =>
                            ValidatorManager().validatePhone(value!),
                        labelText: AppLocalizations.of(context)!.phoneNumber,
                        iconData: Icons.phone,
                        myController: cubit.registerPhoneNumberController,
                        hintText: AppLocalizations.of(context)!.phoneHint,
                        keyboardType: TextInputType.phone,
                      ),
                      const Gap(15),
                      CustomTextField(
                        valid: (value) =>
                            ValidatorManager().validateBirthDate(value!),
                        onTapIcon: () async {
                          await cubit.toSelectDate(context);
                        },
                        labelText: AppLocalizations.of(context)!.birthDate,
                        iconData: Icons.calendar_today,
                        myController: cubit.dateController,
                        hintText: AppLocalizations.of(context)!.birthDateHint,
                      ),
                      const Gap(15),
                      CustomTextField(
                        valid: ((value) =>
                            ValidatorManager().validateProffesion(value!)),
                        labelText: AppLocalizations.of(context)!.profession,
                        iconData: Icons.work_outline_outlined,
                        myController: cubit.professionController,
                        hintText: AppLocalizations.of(context)!.professionHint,
                      ),
                      const Gap(15),
                      CustomTextField(
                        valid: (value) {
                          return null;
                        },
                        labelText: AppLocalizations.of(context)!.habits,
                        iconData: Icons.self_improvement,
                        myController: cubit.habitsController,
                        hintText: AppLocalizations.of(context)!.habitsHint,
                      ),
                      const Gap(15),
                      CustomTextField(
                        labelText: 'Address',
                        iconData: Icons.house,
                        myController: cubit.addressController,
                        hintText: "Damascus",
                        valid: (value) =>
                            ValidatorManager().validateAddress(value!),
                        maxLine: 5,
                        keyboardType: TextInputType.multiline,
                      ),
                      const Gap(15),
                      CustomTextField(
                        labelText: 'Description',
                        iconData: Icons.abc,
                        myController: cubit.descriptionController,
                        hintText: "talk about yourself",
                        valid: (value) {
                          return null;
                        },
                        maxLine: 5,
                        keyboardType: TextInputType.multiline,
                      ),
                      const Gap(15),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              CustomDropDownButton(
                                labelText:
                                    AppLocalizations.of(context)!.maritalStatus,
                                hintText: 'select material state',
                                values: const ['None', 'Single', 'Married'],
                                initialValue: "None",
                                onChanged: (value) {
                                  if (value != null) {
                                    cubit.changeMaritalStatus(value);
                                  }
                                },
                              ),
                              cubit.selectedMaritalStatus == 'Married'
                                  ? const Gap(15)
                                  : const Gap(0),
                              cubit.selectedMaritalStatus == 'Married'
                                  ? CustomTextField(
                                      valid: (value) {
                                        return null;
                                      },
                                      labelText:
                                          AppString.textFieldChildrenNumLabel,
                                      iconData: Icons.child_care_outlined,
                                      myController:
                                          cubit.childrenNumberController,
                                      hintText:
                                          AppString.textFieldChildrenNumHint,
                                      keyboardType: TextInputType.number,
                                    )
                                  : const Gap(0),
                            ],
                          );
                        },
                      ),
                      const Gap(15),
                      CustomDropDownButton(
                        labelText: "Gender",
                        values: const ["Male", "Female"],
                        initialValue: "Male",
                        onChanged: (value) {
                          if (value != null) {
                            cubit.selectedGender = value;
                          }
                        },
                      ),
                      const Gap(15),
                      CustomDropDownButton(
                        labelText: "Blood type",
                        values: const [
                          'A+',
                          'A-',
                          'B+',
                          'B-',
                          'AB+',
                          'AB-',
                          'O+',
                          'O-'
                        ],
                        initialValue: "A+",
                        onChanged: (value) {
                          if (value != null) {
                            cubit.selectedBloodType = value;
                          }
                        },
                      ),
                      const Gap(15),
                      CustomCheckBox(
                        onChanged: (value) {
                          cubit.diabetes = value! ? 1 : 0;
                        },
                        label: AppLocalizations.of(context)!.iHaveDiabetes,
                      ),
                      CustomCheckBox(
                          onChanged: (value) {
                            cubit.bloodPressure = value! ? 1 : 0;
                          },
                          label:
                              AppLocalizations.of(context)!.iHaveBloodPressure),
                      const Gap(20),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return CustomStateButton(
                            onPressed: () async {
                              await BlocProvider.of<AuthCubit>(context)
                                  .register();
                            },
                            currentState: BlocProvider.of<AuthCubit>(context)
                                .registerButtonState,
                            label: AppLocalizations.of(context)!.signup,
                          );
                        },
                      ),
                      CustomRowTextButton(
                        text: AppLocalizations.of(context)!.alreadyHaveAccount,
                        btnText: AppLocalizations.of(context)!.login,
                        onTap: () {
                          context.pushReplacement(AppRouter.kLogin);
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
