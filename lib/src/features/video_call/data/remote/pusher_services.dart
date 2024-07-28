import 'dart:async';
import 'dart:convert';
import 'package:patient_app/src/features/video_call/data/models/event_model.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_cubit.dart';
import 'package:pusher_client_fixed/pusher_client_fixed.dart';
import '../../../../../core/domain/services/locator.dart';
import '../../../../../core/domain/urls/app_url.dart';

class PusherService {
  static late PusherClient pusher;
  late Channel channel;

  String Call_event = 'App\\Events\\CallUser';

  PusherService();

  static Future initPusher()async{
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

  Future<EventModel ?> connectToChannel({
    int id = 1,
    required PusherCubit pushercubit
  }) async {
    channel = pusher.subscribe('channel-user-$id');

    EventModel ? eventModel;

    channel.bind(Call_event, (PusherEvent? event) {
        if (event != null && event.data != null) {
          final data = jsonDecode(event.data!);
          eventModel=EventModel.fromJson(data);
          print("in pusher sevice = ${eventModel!.channel}");
          print('Event data: $data');
          pushercubit.recieveEvent(eventModel: eventModel!);
        } else {
          print('No data received in event');
        }
    });
    return eventModel;
  }
}
