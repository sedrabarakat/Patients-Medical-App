import 'package:go_router/go_router.dart';
import 'package:patient_app/src/features/appointments/presentation/pages/select_appointment.dart';
import 'package:patient_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:patient_app/src/features/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:patient_app/src/features/splash/splash_screen.dart';
import '../../src/features/auth/presentation/pages/sign_up_page.dart';
import '../../src/features/auth/presentation/pages/verify_code_page.dart';
import '../../src/features/video_call/presentation/screens/calles_list.dart';
import '../../src/features/video_call/presentation/screens/ring_screen.dart';
import '../../src/features/video_call/presentation/screens/video_call.dart';
import '../helper/token_helper.dart';

class AppRouter {
  static const kLogin = '/login';
  static const kRegister = '/register';
  static const kVerify = '/verify';
  static const kBottomNavigationScreen = '/bottom_navigation_screen';
  static const kSelectAppointment = '/select_appointment';
  static const kCallsScreen = '/calls_screen';
  static const kRingScreen = '/ring_screen';
  static const kVideoCall = '/video_call';
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => (TokenHelper.hasToken)
            ?SplashScreen(pushRoute: kBottomNavigationScreen)
            :SplashScreen(pushRoute:kLogin),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: kRegister,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: kVerify,
        builder: (context, state) => const VerificationScreen(),
      ),
      GoRoute(
        path: kBottomNavigationScreen,
        builder: (context, state) => const BottomNavigationScreen(),
      ),
      GoRoute(
        path: kSelectAppointment,
        builder: (context, state) => const SelectAppointmentScreen(),
      ),
      GoRoute(
        path: kCallsScreen,
        builder: (context, state) => const CallesList(),
      ),
      GoRoute(
        path: kRingScreen,
        builder: (context, state) => const RingScreen(),
      ),
      GoRoute(
        path: kVideoCall,
        builder: (context, state) => const VideoCall(),
      ),
    ],
  );
}

// final goRouter = GoRouter(
//   initialLocation: '/',
//   debugLogDiagnostics: true,
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => HomeScreenBottomNavBar(),
//       routes: routes.entries
//           .map((entry) => GoRoute(
//               path: entry.key.name,
//               name: entry.key.name,
//               builder: (context, state) {
//                 return entry.value(context, state);
//               }))
//           .toList(),
//     )
//   ],
// );
