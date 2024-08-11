import 'package:get_it/get_it.dart';
import 'package:patient_app/core/domain/services/api_service.dart';
import 'package:patient_app/core/domain/services/api_services_impl.dart';
import 'package:patient_app/core/helper/dio_helper.dart';
import 'package:patient_app/src/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:patient_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:patient_app/src/features/video_call/data/remote/pusher_services.dart';
import 'package:patient_app/src/features/video_call/data/repos/pusher_repo_impl.dart';
import 'package:patient_app/src/features/video_call/data/repos/schedule_repo_impl.dart';
import 'package:patient_app/src/features/video_call/domain/pusher_repo.dart';
import 'package:patient_app/src/features/video_call/domain/schedule_repo.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_cubit.dart';

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
    () => PusherService(),
  );
  /*>>>>>>>>>> PUSHER Cubit<<<<<<<<<<*/
  getIt.registerLazySingleton<PusherCubit>(
    () => PusherCubit(getIt()),
  );

  /*>>>>>>>>>> Schedule <<<<<<<<<<*/
  getIt.registerLazySingleton<RemoteSchedule>(
      ()=>RemoteSchedule(getIt())
  );
  getIt.registerLazySingleton<ScheduleRepo>(
          ()=>ScheduleRepoImpl(getIt())
  );
}
