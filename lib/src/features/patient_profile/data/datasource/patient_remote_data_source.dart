import 'package:flutter/material.dart';
import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/core/data/models/service_model.dart';
import 'package:patient_app/core/domain/services/api_service.dart';
import 'package:patient_app/core/domain/urls/app_url.dart';
import 'package:patient_app/src/features/patient_profile/data/models/session_detail_model.dart';
import 'package:patient_app/src/features/patient_profile/data/models/session_model.dart';

class PatientRemoteDataSource {
  final ApiServices _services;
  PatientRemoteDataSource(this._services);
  /* Session */
  Future<BaseModels> getPatientSessions(int id) async {
    final response = await _services.get("${AppUrl.getPatientSession}$id");
    return BaseModels.fromJson(
        response['data'], (itemJson) => SessionModel.fromJson(itemJson));
  }

  Future<BaseModel<SessionModel>> getSession(int id) async {
    final response = await _services.get("${AppUrl.getSession}$id");
    return BaseModel.fromJson(response, (json) => SessionModel.fromJson(json));
  }
  /* Session */

  /* Session Details */
  Future<BaseModel<SessionDetailModel>> getSessionDetailsInformation(
      int sessionDetailsId) async {
    final response = await _services
        .get("${AppUrl.getSessionDetailsInformation}$sessionDetailsId");
    return BaseModel.fromJson(
        response, (json) => SessionDetailModel.fromJson(json));
  }

  /* Session Details */

  /* Files */
  Future<BaseModel> downloadFile(
      {required String path,
      required String savePath,
      required BuildContext context,
      required int fileId}) async {
    await _services.downloadFile(
        context, "${AppUrl.downloadFile}$path", savePath, fileId);
    return BaseModel(data: null, message: "downloaded successfully");
  }
  /* Files */

  /* Services */
  Future<BaseModels> getServices() async {
    final response = await _services.get(AppUrl.getServices);
    return BaseModels.fromJson(
        response['data'], (itemJson) => ServiceModel.fromJson(itemJson));
  }
  /* Services */

  /* Doctor */
  Future<BaseModel<DoctorModel>> getDoctorInformation(int id) async {
    final response = await _services.get("${AppUrl.getDoctorInformation}$id");
    return BaseModel.fromJson(response, (json) => DoctorModel.fromJson(json));
  }
  /* Doctor */
}
