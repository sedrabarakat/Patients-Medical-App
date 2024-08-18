import 'dart:async';
import 'dart:convert';
import 'package:patient_app/core/domain/services/api_service.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/src/features/video_call/data/models/event_model.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_cubit.dart';
import 'package:pusher_client_fixed/pusher_client_fixed.dart';
import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/urls/app_url.dart';

class PusherService {
  static late PusherClient pusher;
  late Channel channel;
  ApiServices apiServices;

  String Call_event = 'App\\Events\\CallUser';

  PusherService(this.apiServices);

  static Future initPusher() async {
    // Initialize Pusher
    PusherOptions options = const PusherOptions(
      cluster: 'ap2',
      encrypted: false,
    );

    pusher = PusherClient(
      AppKey_Back, // app key in backend
      options,
      autoConnect: false,
    );

    pusher.connect();
    print("Pusher CONNECTED");
  }

  static void handleConnectionStates() {
    pusher.onConnectionStateChange((state) {
      print("CONNECTING in Pusher");
      print(
          "Previous State: ${state?.previousState}, Current State: ${state?.currentState}");
      if (state?.currentState == 'CONNECTED') {
        print("CONNECTED to Pusher");
        //we can call connectToChannel() here
      }
    });

    pusher.onConnectionError((error) {
      print("Error: ${error?.message}");
    });
  }

  Future<EventModel?> connectToChannel(
      {required int id}) async {
    channel = pusher.subscribe('channel-user-$id');

    EventModel? eventModel;

    channel.bind(Call_event, (PusherEvent? event) {
      if (event != null && event.data != null) {
        print(event.data);
        eventModel = EventModel.fromJson(jsonDecode(event.data!));
        PusherCubit.recieveEvent(eventModel: eventModel!);
        AppRouter.navigateToRingScreen();
      } else {
        print('No data received in event');
      }
    });
    return eventModel;
  }

  Future<BaseModel>AccepteCall({
    required String channelName
  })async{
    final Response= await apiServices.post("${AppUrl.acceptCallEvent}$channelName");

    return BaseModel(data: Response['data'],message: Response['message']);
  }

  Future<BaseModel>DeclineCall({
    required String channelName
  })async{
    final Response= await apiServices.post("${AppUrl.declineCallEvent}$channelName");

    return BaseModel(data: Response['data'],message: Response['message']);
  }
}
