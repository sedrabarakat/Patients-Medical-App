import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/patient_profile/data/datasource/patient_remote_data_source.dart';
import 'package:patient_app/src/features/patient_profile/data/models/session_detail_model.dart';
import 'package:patient_app/src/features/patient_profile/data/models/session_model.dart';

class PatientRepo {
  final PatientRemoteDataSource _remote;
  PatientRepo(this._remote);
  /* Session */
  Future<Either<NetworkExceptions, BaseModels>> getPatientSessions(
      int id) async {
    try {
      final response = await _remote.getPatientSessions(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<SessionModel>>> getSession(
      int id) async {
    try {
      final response = await _remote.getSession(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
  /* Session */

  /* Session Details */
  Future<Either<NetworkExceptions, BaseModel<SessionDetailModel>>>
      getSessionDetailsInformation(int sessionDetailsId) async {
    try {
      final response =
          await _remote.getSessionDetailsInformation(sessionDetailsId);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
  /* Session Details */

  /* Services */
  Future<Either<NetworkExceptions, BaseModels>> getServices() async {
    try {
      final response = await _remote.getServices();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
  /* Services */

  /* Doctor */
  Future<Either<NetworkExceptions, BaseModel<DoctorModel>>>
      getDoctorInformation(int id) async {
    try {
      final response = await _remote.getDoctorInformation(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
  /* Doctor */

  /* Files */

  Future<Either<NetworkExceptions, BaseModel>> downloadFile(
      {required String path,
      required String savePath,
      required BuildContext context,
      required int fileId}) async {
    try {
      final response = await _remote.downloadFile(
          path: path, savePath: savePath, context: context, fileId: fileId);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
  /* Files */
}
