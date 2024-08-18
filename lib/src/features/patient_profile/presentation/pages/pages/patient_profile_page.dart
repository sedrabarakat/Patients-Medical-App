import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/domain/services/locator.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/helper/string_helper.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/patient_cubit.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/custom_app_bar.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/detail_card.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/profile_button.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is GetMyInformationLoadingState) {
          return const Expanded(
              child: Center(
            child: CircularProgressIndicator(
              color: ColorsHelper.primary,
            ),
          ));
        } else if (state is GetMyInformationSuccessState) {
          return BlocProvider(
            create: (context) => PatientCubit(getIt()),
            child: Builder(builder: (context) {
              return Scaffold(
                body: Column(
                  children: [
                    CustomAppBar(
                      name: state.myInformation.personalInformation.fullName,
                      maritalStatus: state.myInformation.maritalStatus,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSize.screenPadding),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: DetailCard(
                                  label: 'blood',
                                  icon: Icons.bloodtype,
                                  iconColor: Colors.redAccent,
                                  content: Text(
                                    state.myInformation.bloodType,
                                    style: StyleManager.fontBold20Black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: AppSize.size15,
                              ),
                              Expanded(
                                child: DetailCard(
                                  label: 'age',
                                  icon: Icons.favorite,
                                  iconColor: ColorsHelper.primary,
                                  content: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "${state.myInformation.age} ",
                                        style: StyleManager.fontBold20Black,
                                      ),
                                      TextSpan(
                                        text: 'year old',
                                        style: StyleManager.fontMedium16White
                                            .copyWith(
                                          color: Colors.black54,
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.size15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DetailCard(
                                  label: 'gender',
                                  icon: Icons.male,
                                  iconColor: ColorsHelper.primary,
                                  content: Text(
                                    StringHelper.capitalizeFirstLetter(
                                        state.myInformation.gender),
                                    style: StyleManager.fontBold20Black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: AppSize.size15,
                              ),
                              Expanded(
                                child: DetailCard(
                                  label: 'wallet',
                                  icon: Icons.wallet,
                                  iconColor: Colors.greenAccent,
                                  content: Text(
                                    state.myInformation.wallet.toString(),
                                    style: StyleManager.fontBold20Black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.size20,
                          ),
                          ProfileButton(
                            label: "Personal Information",
                            icon: Icons.person,
                            iconColor: ColorsHelper.primary,
                            onTap: () {
                              context.push(
                                AppRouter.kPatientPersonalInformationScreen,
                              );
                            },
                          ),
                          const SizedBox(
                            height: AppSize.size15,
                          ),
                          ProfileButton(
                            label: "Sessions",
                            icon: Icons.folder_copy,
                            iconColor: Colors.orangeAccent,
                            onTap: () {
                              BlocProvider.of<PatientCubit>(context)
                                  .getPatientSessions(state.myInformation.id);
                              context.push(
                                AppRouter.kPatientSessions,
                                extra: {
                                  'patient': state.myInformation,
                                  'cubit':
                                      BlocProvider.of<PatientCubit>(context),
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        } else {
          return SizedBox();
        }
      },
    ));
  }
}
