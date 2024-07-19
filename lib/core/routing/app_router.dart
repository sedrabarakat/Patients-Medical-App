import 'package:go_router/go_router.dart';
import 'package:patient_app/src/features/appointments/presentation/pages/select_appointment.dart';
import 'package:patient_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:patient_app/src/features/splash/splash_screen.dart';
import 'package:patient_app/src/features/video_call/presentation/screens/video_call_screen.dart';
import '../../src/features/auth/presentation/pages/sign_up_page.dart';
import '../../src/features/auth/presentation/pages/verify_code_page.dart';
import '../../src/features/home/presentation/pages/home_screen_bottom_nav_bar.dart';

enum AppRoute {
  splash,
  login,
  verifyCode,
  register,
  home,
  selectAppointment,
  videoCall,
}

final Map<AppRoute, dynamic> routes = {
  AppRoute.splash: (context, state) => const SplashScreen(),
  AppRoute.login: (context, state) => const LoginPage(),
  AppRoute.verifyCode: (context, state) => const VerificationScreen(),
  AppRoute.register: (context, state) => const SignUpPage(),
  AppRoute.selectAppointment: (context, state) =>
      const SelectAppointmentScreen(),
  AppRoute.videoCall: (context, state) => const VideoCallScreen(),
};

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreenBottomNavBar(),
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
