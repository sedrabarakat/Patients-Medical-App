import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/domain/services/locator.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/widgets/clip_path_container.dart';
import 'package:patient_app/core/widgets/toast_bar.dart';
import 'package:patient_app/src/features/posts/presentation/pages/widgets/app_bar.dart';
import 'package:patient_app/src/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:patient_app/src/features/setting/presentation/cubit/setting_state.dart';
import 'package:patient_app/src/features/setting/presentation/pages/widgets/setting_button.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(getIt()),
      child: Builder(builder: (context) {
        return BlocListener<SettingCubit, SettingState>(
          listener: (context, state) {
            if (state is LogoutErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            } else if (state is LogOutSuccessState) {
              ToastBar.onSuccess(context,
                  message: state.message, title: "Success");
              context.go(AppRouter.kLogin);
            }
          },
          child: Scaffold(
            appBar: appBar(
                title: "Settings",
                leadingIcon: Icons.arrow_back_ios,
                onLeadingPressed: () {
                  context.pop();
                }),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kToolbarHeight,
                    horizontal: AppSize.screenPadding,
                  ),
                  child: Column(
                    children: [
                      SettingButton(
                        leadingIcon: Icons.calendar_month,
                        actionIcon: Icons.arrow_forward_ios,
                        label: "My Appointments",
                        onTap: () {
                          context.push(
                            AppRouter.kMyAppointment,
                            extra: BlocProvider.of<SettingCubit>(context),
                          );
                        },
                      ),
                      const SizedBox(
                        height: AppSize.size20,
                      ),
                      SettingButton(
                        leadingIcon: Icons.error,
                        actionIcon: Icons.arrow_forward_ios,
                        label: "Send Complaint",
                        onTap: () {
                          context.push(AppRouter.kComplaint,
                              extra: BlocProvider.of<SettingCubit>(context));
                        },
                      ),
                      const SizedBox(
                        height: AppSize.size20,
                      ),
                      SettingButton(
                        leadingIcon: Icons.logout,
                        label: "Log out",
                        onTap: () {
                          BlocProvider.of<SettingCubit>(context).logOut();
                        },
                      ),
                    ],
                  ),
                ),
                ClipPathContainer(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
