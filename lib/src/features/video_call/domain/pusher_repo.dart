

import '../data/models/event_model.dart';
import '../presentation/cubits/pusher/pusher_cubit.dart';

abstract class PusherRepo{

  Future<EventModel ? > eventsListen({
    int id=1,
    required PusherCubit pushercubit
});


}