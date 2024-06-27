import 'package:go_router/go_router.dart';
import 'package:patient_app/src/features/splash/splash_screen.dart';

class AppRouter {
  static const kSplash = '/';
  static final router = GoRouter(
    initialLocation: kSplash,
    routes: [
      GoRoute(
        path: kSplash,
        builder: (context, state) => const SplashScreen(),
      )
    ],
  );
}
