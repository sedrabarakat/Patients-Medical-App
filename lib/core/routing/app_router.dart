import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/core/helper/token_helper.dart';
import 'package:patient_app/src/features/appointments/presentation/pages/select_appointment.dart';
import 'package:patient_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:patient_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:patient_app/src/features/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/patient_sessions_screen.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/personal_information_screen.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/session_information_screen.dart';
import 'package:patient_app/src/features/posts/presentation/cubits/posts_cubit.dart';
import 'package:patient_app/src/features/posts/presentation/pages/comment_screen.dart';
import 'package:patient_app/src/features/posts/presentation/pages/new_post_screen.dart';
import 'package:patient_app/src/features/splash/splash_screen.dart';
import '../../src/features/auth/presentation/pages/sign_up_page.dart';
import '../../src/features/auth/presentation/pages/verify_code_page.dart';
import '../../src/features/video_call/presentation/screens/calles_list.dart';
import '../../src/features/video_call/presentation/screens/ring_screen.dart';
import '../../src/features/video_call/presentation/screens/video_call.dart';

class AppRouter {
  static const kLogin = '/login';
  static const kRegister = '/register';
  static const kVerify = '/verify';
  static const kBottomNavigationScreen = '/bottom_navigation_screen';
  static const kSelectAppointment = '/select_appointment';
  static const kCallsScreen = '/calls_screen';
  static const kRingScreen = '/ring_screen';
  static const kVideoCall = '/video_call';
  static const kPatientPersonalInformationScreen = '/personal_information';
  static const kPatientSessions = '/patient_sessions';
  static const kSessionInformation = '$kPatientSessions/session_information';
  static const kNewPost = '/new_post';
  static const kComment = '/comment_screen';

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => (TokenHelper.hasToken)
            ? const SplashScreen(pushRoute: kBottomNavigationScreen)
            : const SplashScreen(pushRoute: kLogin),
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
        builder: (context, state) {
          BlocProvider.of<AuthCubit>(context).getMyInformation();
          return const BottomNavigationScreen();
        },
      ),
      GoRoute(
        path: kSelectAppointment,
        builder: (context, state) {
          DoctorModel doctor = state.extra as DoctorModel;

          return SelectAppointmentScreen(
            doctor: doctor,
          );
        },
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
      GoRoute(
        path: kPatientPersonalInformationScreen,
        builder: (context, state) => const PersonalInformationScreen(),
      ),
      GoRoute(
        path: kPatientSessions,
        builder: (context, state) {
          return PatientSessionsScreen(
            data: state.extra as Map<String, dynamic>,
          );
        },
        routes: [
          GoRoute(
            path: 'session_information',
            builder: (context, state) {
              Map<String, dynamic> data = state.extra as Map<String, dynamic>;
              return SessionInformationScreen(
                data: data,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: kNewPost,
        builder: (context, state) {
          PostsCubit cubit = state.extra as PostsCubit;
          return NewPostScreen(
            cubit: cubit,
          );
        },
      ),
      GoRoute(
        path: kComment,
        builder: (context, state) {
          final cubit = state.extra as PostsCubit;
          return CommentScreen(
            cubit: cubit,
          );
        },
      ),
    ],
  );
}
