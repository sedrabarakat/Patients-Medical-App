import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_cubit.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_states.dart';

class CallesList extends StatelessWidget {
  const CallesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PusherCubit, PusherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: IconButton(
              onPressed: () {
                PusherCubit cubit = PusherCubit.get(context);
                cubit.listen2Channel(context: context);
              },
              icon: const Icon(Icons.call),
            ),
          ),
        );
      },
    );
  }
}
