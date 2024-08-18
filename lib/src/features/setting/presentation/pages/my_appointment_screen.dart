import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/widgets/clip_path_container.dart';
import 'package:patient_app/core/widgets/image_widget.dart';
import 'package:patient_app/core/widgets/toast_bar.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_model.dart';
import 'package:patient_app/src/features/posts/presentation/pages/widgets/app_bar.dart';
import 'package:patient_app/src/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:patient_app/src/features/setting/presentation/cubit/setting_state.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key, required this.cubit});
  final SettingCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit..getMyAppointment(),
      child: Builder(builder: (context) {
        return BlocListener<SettingCubit, SettingState>(
          listener: (context, state) {
            if (state is DeleteAppointmentSuccessState) {
              ToastBar.onSuccess(context,
                  message: state.message, title: "Success");
            } else if (state is DeleteAppointmentErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            }
          },
          child: Scaffold(
            appBar: appBar(
                title: "My Appointment",
                leadingIcon: Icons.arrow_back_ios,
                onLeadingPressed: () {
                  context.pop();
                }),
            body: Stack(
              children: [
                BlocBuilder<SettingCubit, SettingState>(
                  buildWhen: (previous, current) {
                    if (current is GetMyAppointmentErrorState ||
                        current is GetMyAppointmentLoadingState ||
                        current is GetMyAppointmentSuccessState) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    if (state is GetMyAppointmentLoadingState) {
                      return const SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorsHelper.primary,
                          ),
                        ),
                      );
                    } else if (state is GetMyAppointmentErrorState) {
                      return SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetsManager.errorSign,
                              width:
                                  DimensionsHelper.widthPercentage(context, 40),
                              fit: BoxFit.fitWidth,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              NetworkExceptions.getErrorMessage(state.error),
                              style: StyleManager.fontBold18.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is GetMyAppointmentSuccessState) {
                      return ListView.separated(
                        padding: const EdgeInsets.only(
                          top: kToolbarHeight,
                          bottom: AppSize.screenPadding,
                          left: AppSize.screenPadding,
                          right: AppSize.screenPadding,
                        ),
                        itemBuilder: (context, index) => appointmentCell(
                            context: context,
                            appointment: state.appointments[index],
                            onDeletePressed: () {
                              BlocProvider.of<SettingCubit>(context)
                                  .deleteAppointment(
                                      state.appointments[index].id!);
                            }),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: state.appointments.length,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
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

Widget appointmentCell(
    {required context,
    required AppointmentModel appointment,
    required void Function() onDeletePressed}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
    child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        height: 120.h,
        decoration: BoxDecoration(
            color: ColorsHelper.tealLightDark.withOpacity(.2),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image_widget(image: null),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appointment.doctor.user.fullName,
                    style: StyleManager.fontBold20Black),
                Text_Data(
                    data: appointment.doctor.section!.sectionName,
                    text: 'Section'),
                Text_Data(data: "   ${appointment.date}", text: 'Date'),
                Text_Data(data: "   ${appointment.startMin}", text: 'Time'),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: onDeletePressed,
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
            ),
          ],
        )),
  );
}

Widget Text_Data(
    {required String text, required String data, TextStyle? textstyle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        "$text : ",
        style: (textstyle != null) ? textstyle : StyleManager.font14Bold,
      ),
      Text(
        "$data",
        style: StyleManager.fontRegular14P,
      ),
    ],
  );
}
