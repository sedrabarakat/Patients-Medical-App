import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/color_manager.dart';
import 'package:patient_app/core/utils/icon_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/utils/values_manager.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/src/features/appointments/presentation/pages/widgets/available_time_list.dart';
import 'package:patient_app/src/features/appointments/presentation/pages/widgets/custom_calender.dart';

class SelectAppointmentScreen extends StatelessWidget {
  const SelectAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: IconManager.arrowBackIcon,
          color: ColorsManager.black,
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
              const CustomCalender(),
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
              const Expanded(
                child: AvailableTimeList(
                  length: 10,
                  numberOfColumn: 4,
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomButton(
                label: AppLocalizations.of(context)!.book,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
