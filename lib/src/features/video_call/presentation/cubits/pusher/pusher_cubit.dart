import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/src/features/video_call/data/models/event_model.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_states.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../domain/pusher_repo.dart';
import '../agora/video_call_cubit.dart';

class PusherCubit extends Cubit<PusherStates>{

  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();


   final PusherRepo pusherRepo;

  PusherCubit(this.pusherRepo):super(InitPusherState());

  static PusherCubit get(context)=>BlocProvider.of(context);

  Future listen2Channel({
    int id=1,
    required BuildContext context
})async{
    emit(Load_ChannelListenState());
    try{
      var events= await pusherRepo.eventsListen(id: id,pushercubit: get(context));
      emit(Success_ChannelListenState());
    }
    catch(error){
      print(error.toString());
      emit(Error_ChannelListenState());
    }
  }

  EventModel ?CubitEventModel;
  void recieveEvent({
    required EventModel eventModel
}){
    CubitEventModel=eventModel;
    emit(Recive_EventState(eventModel));
    playRingtone();
  }

  void AcceptCall({
    required EventModel eventModel,
    required context
  })async{
    assetsAudioPlayer.stop();
    await VideoCallCubit.get(context).initAgora(token: eventModel.token,channel: eventModel.channel,RemoteUid: eventModel.id);
    emit(AcceptCallState());
  }

  void DeclineCall(){
    emit(DeclineCallState());
    assetsAudioPlayer.stop();
  }

   void playRingtone() {
    assetsAudioPlayer.open(
      Audio(AssetsManager.RingTone),
      autoStart: true,
      loopMode: LoopMode.playlist,
    );
    emit(RingState());
  }
}