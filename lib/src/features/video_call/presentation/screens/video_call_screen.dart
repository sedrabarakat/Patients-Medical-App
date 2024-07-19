import "package:agora_uikit/agora_uikit.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:patient_app/src/features/video_call/presentation/cubits/video_call_cubit.dart";

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCallCubit()..initAgora(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                AgoraVideoViewer(
                  client: BlocProvider.of<VideoCallCubit>(context).client,
                  layoutType: Layout.oneToOne,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: BlocBuilder<VideoCallCubit, VideoCallState>(
                      builder: (context, state) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.4),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed:
                                    BlocProvider.of<VideoCallCubit>(context)
                                        .muteMic,
                                icon: Icon(
                                  BlocProvider.of<VideoCallCubit>(context)
                                          .isMuted
                                      ? Icons.mic_off
                                      : Icons.mic,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              IconButton(
                                onPressed:
                                    BlocProvider.of<VideoCallCubit>(context)
                                        .endCall,
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                icon: const Icon(
                                  Icons.call_end,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              IconButton(
                                onPressed:
                                    BlocProvider.of<VideoCallCubit>(context)
                                        .changeCamera,
                                icon: const Icon(
                                  Icons.switch_camera,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              IconButton(
                                onPressed:
                                    BlocProvider.of<VideoCallCubit>(context)
                                        .disableCamera,
                                icon: Icon(
                                  BlocProvider.of<VideoCallCubit>(context)
                                          .isCameraDisabled
                                      ? Icons.videocam_off
                                      : Icons.videocam,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
