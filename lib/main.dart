import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:patient_app/src/app.dart';
import 'package:patient_app/src/features/video_call/data/remote/pusher_services.dart';

import 'core/cubit/bloc_observer.dart';
import 'core/data/data_source/local.dart';
import 'core/domain/services/locator.dart';
import 'core/helper/token_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  await HiveService.initilized();
  TokenHelper.init();

  await locatorSetUp();
  await PusherService.initPusher();
  PusherService.handleConnectionStates();


  runApp(const PatientApp());
}
