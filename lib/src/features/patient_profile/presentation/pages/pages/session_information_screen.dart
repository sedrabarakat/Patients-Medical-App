import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/helper/string_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/patient_cubit.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/patient_state.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/upload_download_cubit.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/custom_tab_bar.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/patient_card.dart';

class SessionInformationScreen extends StatelessWidget {
  const SessionInformationScreen({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: data['cubit'] as PatientCubit,
        ),
        BlocProvider(create: (context) => DownloadCubit()),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Session Details",
              style: StyleManager.fontMedium18.copyWith(
                color: ColorsHelper.black,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorsHelper.black,
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.screenPadding,
                  left: AppSize.screenPadding,
                  right: AppSize.screenPadding * 2,
                ),
                child: PatientCard(
                  patientName: BlocProvider.of<AuthCubit>(context)
                      .userData!
                      .personalInformation
                      .fullName,
                  gender: StringHelper.capitalizeFirstLetter(
                      BlocProvider.of<AuthCubit>(context).userData!.gender),
                  age: BlocProvider.of<AuthCubit>(context).userData!.age,
                  bloodType:
                      BlocProvider.of<AuthCubit>(context).userData!.bloodType,
                  sessionDate: data['session'].createdDate,
                ),
              ),
              BlocBuilder<PatientCubit, PatientState>(
                buildWhen: (previous, current) {
                  if (current is GetSessionLoadingState ||
                      current is GetSessionErrorState ||
                      current is GetSessionSuccessState) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  if (state is GetSessionLoadingState) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorsHelper.primary,
                        ),
                      ),
                    );
                  } else if (state is GetSessionSuccessState) {
                    return const CustomTabBarView();
                  } else {
                    //todo add the error widget
                    return const Expanded(
                      child: Text("something went wrong"),
                    );
                  }
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
