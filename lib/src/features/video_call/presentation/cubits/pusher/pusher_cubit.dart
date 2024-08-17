import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/data/data_source/local.dart';
import 'package:patient_app/src/features/video_call/data/models/event_model.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_states.dart';
import '../../../domain/pusher_repo.dart';
import '../agora/video_call_cubit.dart';

class PusherCubit extends Cubit<PusherStates>{


   final PusherRepo pusherRepo;
   final BuildContext context;


  PusherCubit(this.pusherRepo,this.context):super(InitPusherState());

  static PusherCubit get(context)=>BlocProvider.of(context);


  Future listen2Channel({
    int id=193,
})async{
    emit(Load_ChannelListenState());
    try{
      await pusherRepo.eventsListen(id: id);
      emit(Success_ChannelListenState());
    }
    catch(error){
      print(error.toString());
      emit(Error_ChannelListenState());
    }
  }


  static EventModel ?Event_Model;
  static void recieveEvent({
    required EventModel eventModel,
}){
    Event_Model=eventModel;

  }




  //todo deleted
  /*void AcceptCall({
    required EventModel eventModel,
    required context,
  })async{
    await VideoCallCubit.get(context).initAgora(token: eventModel.token,channel: eventModel.channel,RemoteUid: eventModel.id);
    //emit(AcceptCallState());
  }*/

   Future<void>AcceptCall({
     required BuildContext context
})async{
     await pusherRepo.AcceptCall(channelName: Event_Model!.channel)
         .then((value){
       value.fold((error) {
         emit(Error_AcceptCall_State());
       }, (message) async{
         await VideoCallCubit.get(context).initAgora(
             token: HiveService.Auth_Box!.get('Token'),
             channel: Event_Model!.channel,
             RemoteUid: Event_Model!.doctor.user.id);
         emit(Success_AcceptCall_State());
       });
     });
   }

   Future<void>DeclineCall()async{
     await pusherRepo.DeclineCall(channelName:  Event_Model!.channel)
         .then((value){
       value.fold((error) {
         emit(Error_DeclineCall_State());
       }, (message) {
         emit(Success_DeclineCall_State());
       });
     });
   }




}