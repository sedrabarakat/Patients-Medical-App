import 'package:dartz/dartz.dart';
import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/setting/data/datasources/setting_remote_data_source.dart';

class SettingRepo {
  final SettingRemoteDataSource _remote;
  SettingRepo(this._remote);

  Future<Either<NetworkExceptions, BaseModels>> getMyAppointment() async {
    try {
      final response = await _remote.getMyAppointment();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> sendComplaint(
      String text) async {
    try {
      final response = await _remote.sendComplaint(text);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> logOut() async {
    try {
      final response = await _remote.logout();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> deleteAppointment(int id) async {
    try {
      final response = await _remote.deleteAppointment(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
