import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/custom_app_bar.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/information_container.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/personal_information_text_field.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              backButton: true,
              onBackButtonPressed: () {
                context.pop();
              },
              name: cubit.userData!.personalInformation.fullName,
              maritalStatus: cubit.userData!.maritalStatus,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.screenPadding),
              child: Column(
                children: [
                  InformationContainer(
                    label: 'General',
                    fields: [
                      PersonalInformationTextField(
                        label: 'First name',
                        initialValue:
                            cubit.userData!.personalInformation.firstName,
                      ),
                      PersonalInformationTextField(
                        label: 'Middle name',
                        initialValue:
                            cubit.userData!.personalInformation.middleName,
                      ),
                      PersonalInformationTextField(
                        label: 'Last name',
                        initialValue:
                            cubit.userData!.personalInformation.lastName,
                      ),
                      PersonalInformationTextField(
                        label: 'Date of birth',
                        initialValue: cubit.userData!.birthDate,
                      ),
                      PersonalInformationTextField(
                        label: 'Address',
                        initialValue: cubit.userData!.address,
                      ),
                      PersonalInformationTextField(
                        label: 'Phone number',
                        initialValue:
                            cubit.userData!.personalInformation.phoneNumber,
                      ),
                      PersonalInformationTextField(
                        label: 'Marital status',
                        initialValue: cubit.userData!.maritalStatus,
                      ),
                      cubit.userData!.childrenNum != null
                          ? PersonalInformationTextField(
                              label: 'Number of children',
                              initialValue:
                                  cubit.userData!.childrenNum.toString(),
                            )
                          : const SizedBox(),
                      // ignore: unnecessary_null_comparison
                      cubit.userData!.proffesion != null
                          ? PersonalInformationTextField(
                              label: 'Profession',
                              initialValue: cubit.userData!.proffesion,
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.size20,
                  ),
                  InformationContainer(
                    label: 'Medical Information',
                    fields: [
                      cubit.userData!.habits != null
                          ? PersonalInformationTextField(
                              label: 'Habits',
                              initialValue: cubit.userData!.habits!,
                            )
                          : const SizedBox(),
                      PersonalInformationTextField(
                        label: 'Diabetes',
                        initialValue:
                            cubit.userData!.diabetes ? "Have" : "Haven't",
                      ),
                      PersonalInformationTextField(
                        label: 'Blood pressure',
                        initialValue:
                            cubit.userData!.bloodPressure ? "Have" : "Haven't",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
