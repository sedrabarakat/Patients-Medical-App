import 'package:dartz/dartz.dart';
import 'package:patient_app/src/features/video_call/data/models/event_model.dart';
import 'package:patient_app/src/features/video_call/data/remote/pusher_services.dart';
import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../domain/pusher_repo.dart';

class PusherRepoImpl extends PusherRepo{
    PusherService pusherService;

    PusherRepoImpl(this.pusherService);

    @override
    Future<EventModel ? > eventsListen({
       required int id,
})async{
      try{
        var response= await pusherService.connectToChannel(id: id
        );
        return response;
      }
      catch(error){
          print(error.toString());
      }
    }

    @override
    Future<Either<NetworkExceptions, String>> AcceptCall(
        {required String channelName,
        }) async {
      try {
        BaseModel baseModel = await pusherService.AccepteCall(channelName: channelName);
        return right(baseModel.message);
      } catch (error) {
        return left(NetworkExceptions.getException(error));
      }
    }

    @override
    Future<Either<NetworkExceptions, String>> DeclineCall(
        {required String channelName,
        }) async {
      try {
        BaseModel baseModel = await pusherService.DeclineCall(channelName: channelName);
        return right(baseModel.message);
      } catch (error) {
        return left(NetworkExceptions.getException(error));
      }
    }

/* pusherService.connectToChannel().then((value){
        if(value.isNotEmpty){
          eventModel= EventModel.fromJson(value);
          return eventModel;
        }
      });*/


}