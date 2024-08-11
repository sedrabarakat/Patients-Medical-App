import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/src/app.dart';
import 'package:patient_app/src/features/video_call/data/remote/pusher_services.dart';

import 'core/cubit/bloc_observer.dart';
import 'core/domain/services/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await locatorSetUp();
  await PusherService.initPusher();
  PusherService.handleConnectionStates();
  runApp(const PatientApp());
}
