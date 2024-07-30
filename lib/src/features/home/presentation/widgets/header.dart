import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/icon_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

import '../../../../../core/helper/dimension_manager.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.welcomeBack,
              style: StyleManager.fontRegular16Black,
            ),
            Text("Ms.tuna", style: StyleManager.fontExtraBold20Black),
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
                  context.push(AppRouter.kSelectAppointment);
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
