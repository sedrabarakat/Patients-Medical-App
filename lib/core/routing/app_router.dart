import 'package:go_router/go_router.dart';
import 'package:patient_app/src/features/appointments/presentation/pages/select_appointment.dart';
import 'package:patient_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:patient_app/src/features/splash/splash_screen.dart';
import '../../src/features/auth/presentation/pages/sign_up_page.dart';
import '../../src/features/auth/presentation/pages/verify_code_page.dart';
import '../../src/features/navigator_bar/presentation/pages/home_screen_bottom_nav_bar.dart';
import '../../src/features/video_call/presentation/screens/calles_list.dart';
import '../../src/features/video_call/presentation/screens/ring_screen.dart';
import '../../src/features/video_call/presentation/screens/video_call.dart';

enum AppRoute {
  splash,
  login,
  verifyCode,
  register,
  home,
  selectAppointment,
  videoCall,
  CallesList,
  RingScreen,
  VideoCall
}

final Map<AppRoute, dynamic> routes = {
  AppRoute.splash: (context, state) => const SplashScreen(),
  AppRoute.login: (context, state) => const LoginPage(),
  AppRoute.verifyCode: (context, state) => const VerificationScreen(),
  AppRoute.register: (context, state) => const SignUpPage(),
  AppRoute.selectAppointment: (context, state) =>
      const SelectAppointmentScreen(),
  AppRoute.CallesList: (context, state) =>  CallesList(),
  AppRoute.RingScreen: (context, state) =>  RingScreen(),
  AppRoute.VideoCall:(context, state) =>VideoCall()

};

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  HomeScreenBottomNavBar(),
      routes: routes.entries
          .map((entry) => GoRoute(
              path: entry.key.name,
              name: entry.key.name,
              builder: (context, state) {
                return entry.value(context, state);
              }))
          .toList(),
    )
  ],
);
