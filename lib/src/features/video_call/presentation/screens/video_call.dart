import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/agora/video_call_cubit.dart';
import 'package:patient_app/src/features/video_call/presentation/widget/local_video_widget.dart';
import '../../../../../core/routing/app_router.dart';
import '../widget/buttons_bar.dart';
import '../widget/remote_video_widgets.dart';

class VideoCall extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoCallCubit,VideoCallState>(
      listener: (context,state){
        if(state is EndCallstate){
          goRouter.pushNamed(AppRoute.CallesList.name);
        }
      },
      builder: (context,state){
        VideoCallCubit cubit= VideoCallCubit.get(context);
        return Scaffold(
          body: (cubit.engine!=null)?SafeArea(
            child: Stack(
              children: [
                Center(
                  child: remoteVideo(remoteUid: cubit.RemoteUid, engine: cubit.engine!, channel_name: 's'),
                ),
                localVideo(cubit: cubit),
                buttonsBar(cubit: cubit)
              ],
            ),
          ):
          CircularProgressIndicator(),
        );
      },
    );
  }
}