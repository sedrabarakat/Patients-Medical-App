import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/core/data/models/service_model.dart';
import 'package:patient_app/core/helper/file_helper.dart';
import 'package:patient_app/src/features/patient_profile/data/models/file_model.dart';
import 'package:patient_app/src/features/patient_profile/data/models/session_detail_model.dart';
import 'package:patient_app/src/features/patient_profile/data/models/session_model.dart';
import 'package:patient_app/src/features/patient_profile/domain/patient_repo.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  final PatientRepo _repo;
  PatientCubit(this._repo) : super(PatientInitialState());

  /* Session */
  SessionModel? session;
  Future<void> getPatientSessions(int id) async {
    emit(GetPatientSessionsLoadingState());
    final response = await _repo.getPatientSessions(id);
    response.fold((error) {
      emit(GetPatientSessionsErrorState(error));
    }, (data) async {
      // setting opened and archive session
      List<SessionModel> closedSession = [];
      List<SessionModel> openedSession = [];
      for (int i = 0; i < data.list.length; i++) {
        SessionModel temp = data.list[i] as SessionModel;
        temp.closed == 0 ? openedSession.add(temp) : closedSession.add(temp);
      }
      // if the service is empty get them to display the name of the service
      if (services.isEmpty) {
        await getServices();
      }
      emit(GetpatientSessionsSuccessState(
        openedSession: openedSession,
        closedSession: closedSession,
      ));
    });
  }

  Future<void> getSession(int id) async {
    tabs.clear();
    emit(GetSessionLoadingState());
    // id => session id
    final response = await _repo.getSession(id);
    response.fold(
      (error) {
        emit(GetSessionErrorState(error));
      },
      (data) {
        session = data.data!;
        getTabs();
        emit(GetSessionSuccessState(data.data!));
        // to get the first tab session details information
        if (tabs.isNotEmpty) {
          getSessionDetailsInformation(tabs[0].id);
        }
      },
    );
  }
  /* Session */

  /* Session Details */
  Future<void> getSessionDetailsInformation(int sessionDetailsId) async {
    // if the data is fetched already don't call the api
    for (int i = 0; i < tabs.length; i++) {
      if (tabs[i].id == sessionDetailsId) {
        if (tabs[i].fetched) {
          emit(GetSessionDetailsInformationSuccessState(
            sessionDetails: tabs[i].sessionDetails,
            sessionDetailsId: tabs[i].id,
            doctor: tabs[i].supervisorDoctor!,
          ));
          return;
        }
      }
    }
    emit(GetSessionDetailsInformationLoadingState(
      sessionDetailsId: sessionDetailsId,
    ));
    final response = await _repo.getSessionDetailsInformation(sessionDetailsId);
    response.fold((error) {
      emit(GetSessionDetailsInformationErrorState(
          error: error, sessionDetailsId: sessionDetailsId));
    }, (data) async {
      int index = tabs.indexWhere((tab) => tab.id == sessionDetailsId);
      tabs[index].sessionDetails = data.data!;
      DoctorModel? doctor =
          await getDoctorInformation(tabs[index].sessionDetails.doctorId);

      await labelTheDownloadedFile(tabs[index].sessionDetails.files);
      tabs[index].supervisorDoctor = doctor;
      tabs[index].fetched = true;
      emit(GetSessionDetailsInformationSuccessState(
        sessionDetails: tabs[index].sessionDetails,
        sessionDetailsId: sessionDetailsId,
        doctor: doctor!,
      ));
    });
  }
  /* Session Details */

  /* Services */
  List<ServiceModel> services = [];
  Future<void> getServices() async {
    final response = await _repo.getServices();
    response.fold(
      (error) {
        emit(GetSessionErrorState(error));
      },
      (data) {
        for (int i = 0; i < data.list.length; i++) {
          ServiceModel temp = data.list[i] as ServiceModel;
          services.add(temp);
        }
      },
    );
  }

  String getServiceNameById(int id) {
    return services.firstWhere((element) => element.id == id).name;
  }
  /* Services */

  /* Tab */

  List<TabModel> tabs = [];
  int selectedTabIndex = 0;
  TabController getTabController(ticker) {
    return TabController(length: tabs.length, vsync: ticker);
  }

  List<TabModel> getTabs() {
    tabs.clear();
    if (tabs.isEmpty) {
      for (int i = 0; i < session!.sessionDetails.length; i++) {
        tabs.add(
          TabModel(
            tabName: getServiceNameById(session!.sessionDetails[i].serviceId),
            id: session!.sessionDetails[i].id,
            sessionDetails: session!.sessionDetails[i],
          ),
        );
      }
    }
    return tabs;
  }
  /* Tab */

  /* Files */
  Future<void> labelTheDownloadedFile(List<FileModel> files) async {
    for (int i = 0; i < files.length; i++) {
      if (await FileHelper.fileExists(
          files[i].path, files[i].id, files[i].fileType)) {
        files[i].downloaded = true;
      }
    }
  }
  /* Files */

  /* Doctor */
  Future<DoctorModel?> getDoctorInformation(int id) async {
    final response = await _repo.getDoctorInformation(id);
    return response.fold((error) => null, (data) => data.data);
  }
  /* Doctor */

  /* Files */
  Future<void> downloadAndSaveFile(
    String path,
    BuildContext context,
    int fileId,
    String fileName,
  ) async {
    final downloadDirectory = await getDownloadsDirectory();
    String type = FileHelper.fileExtension(path);
    final filePath = '${downloadDirectory!.path}/$fileName$fileId.$type';
    final response = await _repo.downloadFile(
        // ignore: use_build_context_synchronously
        path: path,
        savePath: filePath,
        context: context,
        fileId: fileId);
    response.fold((error) {}, (data) {
      for (int i = 0;
          i < tabs[selectedTabIndex].sessionDetails.files.length;
          i++) {
        if (tabs[selectedTabIndex].sessionDetails.files[i].id == fileId) {
          tabs[selectedTabIndex].sessionDetails.files[i].downloaded = true;
          break;
        }
      }
      emit(
        GetSessionDetailsInformationSuccessState(
          sessionDetails: tabs[selectedTabIndex].sessionDetails,
          sessionDetailsId: tabs[selectedTabIndex].id,
          doctor: tabs[selectedTabIndex].supervisorDoctor!,
        ),
      );
    });
  }
  /* Files */
}

class TabModel {
  String tabName;
  SessionDetailModel sessionDetails;
  DoctorModel? supervisorDoctor;
  int id;
  bool fetched;
  TabModel({
    required this.tabName,
    required this.id,
    required this.sessionDetails,
    this.supervisorDoctor,
    this.fetched = false,
  });
}
