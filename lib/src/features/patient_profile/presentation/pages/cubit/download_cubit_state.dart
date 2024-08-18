abstract class DownloadCubitState {}

class DownloadInitialState extends DownloadCubitState {}

class DownloadingFileState extends DownloadCubitState {
  final int fileId;
  final double value;
  DownloadingFileState(this.value, this.fileId);
}

class DownloadedState extends DownloadCubitState {
  final int fileId;
  DownloadedState(this.fileId);
}
