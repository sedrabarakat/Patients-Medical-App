import 'package:patient_app/src/features/video_call/data/models/event_model.dart';
import 'package:patient_app/src/features/video_call/data/remote/pusher_services.dart';
import '../../domain/pusher_repo.dart';
import '../../presentation/cubits/pusher/pusher_cubit.dart';

class PusherRepoImpl extends PusherRepo{
    PusherService pusherService;

    PusherRepoImpl(this.pusherService);

    @override
    Future<EventModel ? > eventsListen({
        int id=1,
      required PusherCubit pushercubit
})async{
      try{
        var response= await pusherService.connectToChannel(id: id,pushercubit: pushercubit);
        return response;
      }
      catch(error){
          print(error.toString());
      }
    }

/* pusherService.connectToChannel().then((value){
        if(value.isNotEmpty){
          eventModel= EventModel.fromJson(value);
          return eventModel;
        }
      });*/


}