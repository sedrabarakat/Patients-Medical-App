import 'package:bloc/bloc.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/download_cubit_state.dart';

class DownloadCubit extends Cubit<DownloadCubitState> {
  DownloadCubit() : super(DownloadInitialState());
  void downloadingFileProgress(double progress, int fileId) {
    if (progress < 1) {
      emit(
        DownloadingFileState(progress, fileId),
      );
    } else {
      print(progress);
      emit(DownloadedState(fileId));
    }
  }
}
