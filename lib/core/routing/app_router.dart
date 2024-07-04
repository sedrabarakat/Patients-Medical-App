import 'package:go_router/go_router.dart';
import 'package:patient_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:patient_app/src/features/home/presentation/home_page.dart';
import 'package:patient_app/src/features/splash/splash_screen.dart';
import '../../src/features/auth/presentation/pages/sign_up_page.dart';
import '../../src/features/auth/presentation/pages/verify_code_page.dart';

enum AppRoute{
  splash,
  login,
  verifyCode,
  register,
  home,
}

final Map<AppRoute, dynamic> routes = {
  AppRoute.splash:(context, state) => const SplashScreen(),
  AppRoute.login:(context , state) => const LoginPage(),
  AppRoute.verifyCode: (context, state) => const VerificationScreen(),
  AppRoute.register : (context , state) => const SignUpPage(),
  AppRoute.home : (context, state)=>const HomePage(),
};


final goRouter  = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const VerificationScreen(),
      routes:routes.entries.map((entry)=>
          GoRoute(
            path:entry.key.name,
            name: entry.key.name,
            builder:(context, state){
              return entry.value(context, state);
            }
          )
      ).toList()
    )
  ],
);
// class AppRouter {
//   static const kSplash = '/';
//   static final router = GoRouter(
//     initialLocation: kSplash,
//     routes: [
//       GoRoute(
//         path: kSplash,
//         builder: (context, state) =>const VerificationCodePage(),
//       )
//     ],
//   );
// }
