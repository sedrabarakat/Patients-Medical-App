import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/src/features/favoriate/presentation/pages/favorite_page.dart';
import 'package:patient_app/src/features/navigator_bar/presentation/cubit/bottom_nav_cubit.dart';
import 'package:patient_app/src/features/setting/presentation/pages/setting_page.dart';
import '../../../patient_profile/presentation/pages/patient_profile_page.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../../home/presentation/pages/home_screen_content.dart';

class HomeScreenBottomNavBar extends StatelessWidget {
  const HomeScreenBottomNavBar({super.key});

  final List<Widget> _pages = const [
    HomeContent(),
    PatientProfilePage(),
    FavoritePage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) => _pages[currentIndex],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
