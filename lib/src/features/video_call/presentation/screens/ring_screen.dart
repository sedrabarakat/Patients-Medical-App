import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_cubit.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_states.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/style_manager.dart';
import '../widget/call_buttons.dart';

class RingScreen extends StatelessWidget {
  const RingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PusherCubit, PusherStates>(
      listener: (context, state) {
        if (state is AcceptCallState) {
          context.push(AppRouter.kRingScreen);
        }
        if (state is DeclineCallState) {
          context.push(AppRouter.kCallsScreen);
        }
      },
      builder: (context, states) {
        PusherCubit cubit = PusherCubit.get(context);
        return Scaffold(
          body: Container(
            decoration: StyleManager.Background_Call,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  AssetsManager.user,
                  width: 200.h,
                )),
                Padding(
                  padding: EdgeInsets.only(top: 50.h, bottom: 300.h),
                  child: Text(
                    "Dr.Mira",
                    style: StyleManager.fontExtraBold20Black,
                  ),
                ),
                callButtons(cubit: cubit, context: context)
              ],
            ),
          ),
        );
      },
    );
  }
}
