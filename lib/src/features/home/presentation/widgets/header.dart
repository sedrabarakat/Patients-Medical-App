import 'package:flutter/material.dart';
import 'package:patient_app/core/data/models/patient_model.dart';
import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import '../../../../../core/helper/dimension_manager.dart';
import '../../../../../core/widgets/search_field.dart';

class Header extends StatelessWidget {
  final PatientModel patient;

  const Header({super.key, required this.patient});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: const TextSpan(
              text: 'Welcome Back..',
              style: StyleManager.fontRegular16Black,
            )),
            Text(
                patient.gender == 'female'
                    ? 'Ms.${patient.userData.firstName} ${patient.userData.lastName}'
                    : 'Mr.${patient.userData.firstName} ${patient.userData.lastName}',
                style: StyleManager.fontExtraBold20Black),
            searchIcon(context)
          ],
        ),
        Row(
          children: [
            _circularIconWithRadius(
              IconButton(
                icon: IconManager.searchIcon,
                onPressed: () {
                  context.push(AppRouter.kVideoCall);
                },
              ),
            ),
            _circularIconWithRadius(
              IconButton(
                icon: IconManager.notificationIcon,
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).getMyInformation();
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _circularIconWithRadius(IconButton iconButton) => Container(
        margin: const EdgeInsets.all(AppSize.s2_5),
        //Todo: need to make this responsive
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(width: AppSize.s1_5, color: ColorsHelper.grey),
            borderRadius: BorderRadius.circular(30)),
        child: iconButton,
      );
}
