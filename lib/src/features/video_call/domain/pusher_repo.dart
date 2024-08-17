

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/domain/error_handler/network_exceptions.dart';
import '../data/models/event_model.dart';


abstract class PusherRepo{

  Future<EventModel ? > eventsListen({
     required  int id,
});

  Future<Either<NetworkExceptions, String>> AcceptCall(
      {required String channelName,
      });

  Future<Either<NetworkExceptions, String>> DeclineCall(
      {required String channelName,
      });



}