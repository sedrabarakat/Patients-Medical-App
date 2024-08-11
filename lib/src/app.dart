import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/utils/theme_manager.dart';
import 'package:patient_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_states.dart';
import '../core/domain/services/locator.dart';
import 'features/navigator_bar/presentation/cubit/bottom_nav_cubit.dart';
import 'features/video_call/presentation/cubits/agora/video_call_cubit.dart';
import 'features/video_call/presentation/cubits/pusher/pusher_cubit.dart';

class PatientApp extends StatelessWidget {
  const PatientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(
            create: (context) =>
                PusherCubit(getIt())..listen2Channel(context: context)),
        BlocProvider(create: (context) => VideoCallCubit()),
        BlocProvider(create: (context) => AuthCubit(getIt())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360,690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocListener<PusherCubit, PusherStates>(
          listener: (context, state) {
            if (state is Recive_EventState) {
              context.push(AppRouter.kRingScreen);
            }
          },
          child: MaterialApp.router(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            theme: ThemeManager.myTheme,
            routerConfig: AppRouter.router,
          ),
        ),
      ),
    );
  }
}
