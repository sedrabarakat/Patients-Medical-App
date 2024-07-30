import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/utils/font_manager.dart';
import 'package:patient_app/core/utils/icon_manager.dart';
import '../../../../../core/helper/dimension_manager.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../cubit/bottom_nav_cubit.dart';
import 'custom_lamp_shadow.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: IconManager.homeIcon,
        label: AppLocalizations.of(context)!.home,
      ),
      BottomNavigationBarItem(
        icon: IconManager.profileIcon,
        label: AppLocalizations.of(context)!.profile,
      ),
      BottomNavigationBarItem(
        icon: IconManager.favoriteIcon,
        label: AppLocalizations.of(context)!.favorite,
      ),
      BottomNavigationBarItem(
        icon: IconManager.settingIcon,
        label: AppLocalizations.of(context)!.settings,
      ),
    ];

    return BlocBuilder<BottomNavCubit, int>(builder: (context, state) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final double totalWidth = constraints.maxWidth;
          const double totalItems = 4.5;
          final double itemWidth = totalWidth / totalItems;

          return Stack(
            children: [
              BottomNavigationBar(
                currentIndex: state,
                onTap: (index) =>
                    context.read<BottomNavCubit>().updateIndex(index),
                selectedItemColor: ColorsHelper.primary,
                unselectedItemColor: ColorsHelper.grey,
                unselectedFontSize: FontSize.s14,
                selectedLabelStyle: StyleManager.fontRegular16primary,
                unselectedLabelStyle: StyleManager.fontRegular14grey,
                items: items,
              ),

              //Todo: need to edit to make all size responsive with all screen
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: AppLocalizations.of(context)!.localeName == 'en'
                    ? itemWidth * state + (itemWidth / 10) + 5
                    : null,
                right: AppLocalizations.of(context)!.localeName == 'ar'
                    ? itemWidth * state + (itemWidth / 10) + 5
                    : null,
                bottom: 60,
                width: 90,
                child: CustomLampShadow(
                  width: DimensionsHelper.widthPercentage(context, 10),
                  height: 20,
                  color: ColorsHelper.primary,
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
