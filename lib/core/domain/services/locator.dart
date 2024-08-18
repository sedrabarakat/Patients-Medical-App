import 'package:get_it/get_it.dart';
import 'package:patient_app/core/domain/services/api_service.dart';
import 'package:patient_app/core/domain/services/api_services_impl.dart';
import 'package:patient_app/core/helper/dio_helper.dart';
import 'package:patient_app/src/features/appointments/data/datasources/appointment_remote_data_source.dart';
import 'package:patient_app/src/features/appointments/domain/appointment_repo.dart';
import 'package:patient_app/src/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:patient_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:patient_app/src/features/favoriate/data/fav_remote/fav_remote.dart';
import 'package:patient_app/src/features/favoriate/data/fav_repo/fave_repo.dart';
import 'package:patient_app/src/features/patient_profile/data/datasource/patient_remote_data_source.dart';
import 'package:patient_app/src/features/patient_profile/domain/patient_repo.dart';
import 'package:patient_app/src/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:patient_app/src/features/posts/domain/posts_repo.dart';
import 'package:patient_app/src/features/home/data/remote/home_remote.dart';
import 'package:patient_app/src/features/setting/data/datasources/setting_remote_data_source.dart';
import 'package:patient_app/src/features/setting/domain/setting_repo.dart';
import 'package:patient_app/src/features/video_call/data/remote/pusher_services.dart';
import 'package:patient_app/src/features/video_call/data/repos/pusher_repo_impl.dart';
import 'package:patient_app/src/features/video_call/data/repos/schedule_repo_impl.dart';
import 'package:patient_app/src/features/video_call/domain/pusher_repo.dart';
import 'package:patient_app/src/features/video_call/domain/schedule_repo.dart';

import '../../../src/features/video_call/data/remote/remote_schedule.dart';

final getIt = GetIt.I;

Future locatorSetUp() async {
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServicesImp(DioHelper().dio),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt()),
  );

  /*>>>>>>>>>> PUSHER Repo<<<<<<<<<<*/
  getIt.registerLazySingleton<PusherRepo>(
    () => PusherRepoImpl(getIt()),
  );
  /*>>>>>>>>>> PUSHER Service<<<<<<<<<<*/
  getIt.registerLazySingleton<PusherService>(
    () => PusherService(getIt()),
  );
  /*>>>>>>>>>> Schedule <<<<<<<<<<*/
  getIt.registerLazySingleton<RemoteSchedule>(() => RemoteSchedule(getIt()));
  getIt.registerLazySingleton<ScheduleRepo>(() => ScheduleRepoImpl(getIt()));
  /*>>>>>>>>>> Patient <<<<<<<<<<*/
  getIt.registerLazySingleton<PatientRemoteDataSource>(
    () => PatientRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<PatientRepo>(
    () => PatientRepo(getIt()),
    /*>>>>>>>>>> Appointment <<<<<<<<<<*/
  );
  getIt.registerLazySingleton<AppointmentRemoteDataSource>(
    () => AppointmentRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<AppointmentRepo>(
    () => AppointmentRepo(getIt()),
  );

  /*>>>>>>>>>> Posts <<<<<<<<<<*/
  getIt.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<PostsRepo>(
    () => PostsRepo(getIt()),
  );
  /*>>>>>>>>>> Home <<<<<<<<<<*/
  getIt.registerLazySingleton<HomeRemote>(() => HomeRemote(getIt()));

  /*>>>>>>>>>> Fav <<<<<<<<<<*/
  getIt.registerLazySingleton<FavRemote>(
    () => FavRemote(getIt()),
  );
  getIt.registerLazySingleton<FaveRepo>(
    () => FaveRepo(getIt()),
  );
  getIt.registerLazySingleton<SettingRemoteDataSource>(
    () => SettingRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<SettingRepo>(
    () => SettingRepo(getIt()),
  );
  getIt.registerLazySingleton<HomeRemote>(
          ()=>HomeRemote(getIt())
  );



}
