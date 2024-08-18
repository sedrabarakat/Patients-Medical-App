import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/core/domain/services/locator.dart';

import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/icon_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/utils/values_manager.dart';
import 'package:patient_app/core/widgets/custom_progress_state_button.dart';
import 'package:patient_app/core/widgets/toast_bar.dart';
import 'package:patient_app/src/features/appointments/presentation/cubit/appointment_cubit.dart';
import 'package:patient_app/src/features/appointments/presentation/cubit/appointment_state.dart';
import 'package:patient_app/src/features/appointments/presentation/pages/widgets/available_time_list.dart';
import 'package:patient_app/src/features/appointments/presentation/pages/widgets/custom_calender.dart';

class SelectAppointmentScreen extends StatelessWidget {
  const SelectAppointmentScreen({super.key, required this.doctor});
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentCubit(getIt()),
      child: Builder(builder: (context) {
        return BlocListener<AppointmentCubit, AppointmentState>(
          listener: (context, state) {
            if (state is MakeAppointmentSuccessState) {
              ToastBar.onSuccess(context,
                  message: "Booked an appointment successfully",
                  title: "Success");
            } else if (state is MakeAppointmentErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            }
          },
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: IconManager.arrowBackIcon,
                color: ColorsHelper.black,
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: AppPadding.appPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.chooseDate,
                          style: StyleManager.fontExtraBold26Black,
                        ),
                        SvgPicture.asset(
                          AssetsManager.calender,
                          width: 30,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s24,
                    ),
                    CustomCalender(
                      dayInAdvance: doctor.days_in_advance,
                      onDaySelected: (day) {
                        BlocProvider.of<AppointmentCubit>(context)
                            .selectedDate = day;
                        BlocProvider.of<AppointmentCubit>(context)
                            .getAppointmentInSpecificDayAndDate(doctor.id);
                      },
                        onCalenderIniti: (day) {
                          BlocProvider.of<AppointmentCubit>(context)
                              .selectedDate = day;
                          BlocProvider.of<AppointmentCubit>(context)
                              .getAppointmentInSpecificDayAndDate(doctor.id);
                        },
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.chooseTime,
                          style: StyleManager.fontExtraBold26Black,
                        ),
                        SvgPicture.asset(
                          AssetsManager.clock,
                          width: 30,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s24,
                    ),
                    Expanded(
                      child: BlocBuilder<AppointmentCubit, AppointmentState>(
                        buildWhen: (previous, current) {
                          if (current is GetAppointmentErrorState ||
                              current is GetAppointmentLoadingState ||
                              current is GetAppointmentSuccessState) {
                            return true;
                          } else {
                            return false;
                          }
                        },
                        builder: (context, state) {
                          if (state is GetAppointmentLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: ColorsHelper.primary,
                              ),
                            );
                          } else if (state is GetAppointmentErrorState) {
                            return Center(
                              child: Text(
                                NetworkExceptions.getErrorMessage(state.error),
                              ),
                            );
                          } else if (state is GetAppointmentSuccessState) {
                            //todo the image is not correct of the empty list
                            return state.appointment.availableTimes.isNotEmpty
                                ? AvailableTimeList(
                                    appointment: state.appointment,
                                    numberOfColumn: 4,
                                    onTimeSelected: (time) {
                                      BlocProvider.of<AppointmentCubit>(context)
                                          .startMin = time;
                                    },
                                  )
                                : Center(
                                    child: Expanded(
                                      child: SvgPicture.asset(
                                        AssetsManager.noTime,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  );
                          } else {
                            return const Center(
                              child: Text("Something went wrong"),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    BlocBuilder<AppointmentCubit, AppointmentState>(
                      builder: (context, state) {
                        return CustomStateButton(
                          onPressed: () {
                            if (BlocProvider.of<AppointmentCubit>(context)
                                    .startMin ==
                                null) {
                              ToastBar.showTOAST(
                                context,
                                textToast: "Please Select Time",
                                title: "Error",
                                status: ToastStatus.failure,
                              );
                              return;
                            }
                            BlocProvider.of<AppointmentCubit>(context)
                                .makeAppointment(
                              doctor.id,
                            );
                          },
                          currentState:
                              BlocProvider.of<AppointmentCubit>(context)
                                  .bookAppointmetButtonState,
                          label: AppLocalizations.of(context)!.book,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
