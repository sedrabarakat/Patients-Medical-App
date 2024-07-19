import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/utils/color_manager.dart';
import 'package:patient_app/core/utils/icon_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

import '../../../../../core/helper/dimension_manager.dart';
import '../../../../../core/utils/string_manager.dart';

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
            const Text(AppString.welcomeBack,
                style: StyleManager.fontRegular16Black),
            Text("Ms.tuna", style: StyleManager.fontExtraBold20Black),
          ],
        ),
        Row(
          children: [
            _circularIconWithRadius(
              IconButton(
                icon: IconManager.searchIcon,
                onPressed: () {
                  GoRouter.of(context).pushNamed(AppRoute.videoCall.name);
                },
              ),
            ),
            _circularIconWithRadius(
              IconButton(
                icon: IconManager.notificationIcon,
                onPressed: () {},
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
            border: Border.all(width: AppSize.s1_5, color: ColorsManager.grey),
            borderRadius: BorderRadius.circular(30)),
        child: iconButton,
      );
}
