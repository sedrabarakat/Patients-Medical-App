import 'package:patient_app/src/features/video_call/data/models/event_model.dart';

abstract class PusherStates{}

class InitPusherState extends PusherStates{}

class Load_ChannelListenState extends PusherStates{}

class Success_ChannelListenState extends PusherStates{}

class Error_ChannelListenState extends PusherStates{}

class HandelingPusherStates extends PusherStates{}

class Recive_EventState extends PusherStates{
  EventModel eventModel;
  Recive_EventState(this.eventModel);
}

class RingState extends PusherStates{}


class AcceptCallState extends PusherStates{}

class DeclineCallState extends PusherStates{}