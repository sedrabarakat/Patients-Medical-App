import 'package:get_it/get_it.dart';
import 'package:patient_app/src/features/video_call/data/remote/pusher_services.dart';
import 'package:patient_app/src/features/video_call/data/repos/pusher_repo_impl.dart';
import 'package:patient_app/src/features/video_call/domain/pusher_repo.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/pusher/pusher_cubit.dart';

final getIt = GetIt.I;

Future locatorSetUp() async {

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
}
