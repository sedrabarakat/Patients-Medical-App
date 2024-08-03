import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/src/features/favoriate/presentation/pages/favorite_page.dart';
import 'package:patient_app/src/features/home/presentation/pages/home_screen_content.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/patient_profile_page.dart';
import 'package:patient_app/src/features/setting/presentation/pages/setting_page.dart';
import 'package:patient_app/src/features/video_call/presentation/screens/video_call.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final PageController _pageController = PageController();
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);
  final List<Widget> bottomBarPages = [
    const HomeContent(),
    const FavoritePage(),
    const VideoCall(),
    const PatientProfilePage(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: ColorsHelper.white,
        showLabel: true,
        textOverflow: TextOverflow.visible,
        maxLine: 1,
        shadowElevation: 5,
        kBottomRadius: 0,
        notchColor: ColorsHelper.primary,
        removeMargins: true,
        showShadow: false,
        durationInMilliSeconds: 300,
        itemLabelStyle: StyleManager.fontMedium13.copyWith(
          color: const Color(0XFF8891A5),
        ),
        elevation: 1,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.home),
            activeItem: Icon(
              Icons.home,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.favorite),
            activeItem: Icon(
              Icons.favorite,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Favorite',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.call),
            activeItem: Icon(
              Icons.call,
              color: ColorsHelper.white,
            ),
            itemLabel: "Call",
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person),
            activeItem: Icon(
              Icons.person,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Profile',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.settings),
            activeItem: Icon(
              Icons.settings,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Settings',
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      ),
    );
  }
}
