import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/widgets/clip_path_container.dart';
import 'package:patient_app/core/widgets/custom_progress_state_button.dart';
import 'package:patient_app/core/widgets/custom_text_field.dart';
import 'package:patient_app/core/widgets/toast_bar.dart';
import 'package:patient_app/src/features/posts/presentation/pages/widgets/app_bar.dart';
import 'package:patient_app/src/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:patient_app/src/features/setting/presentation/cubit/setting_state.dart';

class SendComplaintScreen extends StatelessWidget {
  const SendComplaintScreen({super.key, required this.cubit});
  final SettingCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Builder(builder: (context) {
        return BlocListener<SettingCubit, SettingState>(
          listener: (context, state) {
            if (state is SendComplaintErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            } else if (state is SendComplaintSuccessState) {
              ToastBar.onSuccess(context,
                  message: state.message, title: "Success");
            }
          },
          child: Form(
            key: BlocProvider.of<SettingCubit>(context).complaintFormKey,
            child: Scaffold(
              appBar: appBar(
                  title: "Settings",
                  leadingIcon: Icons.arrow_back_ios,
                  onLeadingPressed: () {
                    context.pop();
                    BlocProvider.of<SettingCubit>(context)
                        .complaintTextEditingControlelr
                        .clear();
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
                        CustomTextField(
                          maxLine: 9,
                          labelText: "Complaint",
                          iconData: Icons.comment_rounded,
                          myController: BlocProvider.of<SettingCubit>(context)
                              .complaintTextEditingControlelr,
                          hintText: "Write your complaint",
                          keyboardType: TextInputType.multiline,
                          valid: (value) {
                            if (value!.isEmpty) {
                              return "Can't be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<SettingCubit, SettingState>(
                          builder: (context, state) {
                            return CustomStateButton(
                                onPressed: () {
                                  if (BlocProvider.of<SettingCubit>(context)
                                      .complaintFormKey
                                      .currentState!
                                      .validate()) {
                                    BlocProvider.of<SettingCubit>(context)
                                        .sendComplaint();
                                  }
                                },
                                currentState:
                                    BlocProvider.of<SettingCubit>(context)
                                        .sendComplaintButtonState,
                                label: "Send");
                          },
                        ),
                      ],
                    ),
                  ),
                  ClipPathContainer(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
