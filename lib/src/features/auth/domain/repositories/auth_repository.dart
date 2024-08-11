import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/data/models/patient_model.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/auth/data/data_source/remote/auth_remote_data_source.dart';

import '../../../../../core/data/models/user_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepository(this._authRemoteDataSource);
  Future<Either<NetworkExceptions, BaseModel>> requestCode(
      String phoneNumber) async {
    try {
      final response = await _authRemoteDataSource.requestCode(phoneNumber);

      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<UserModel>>>
      verifyCode(String phoneNumber, String code) async {
    try {
      final response =
          await _authRemoteDataSource.verifiyCode(phoneNumber, code);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<PatientModel>>> register({
    required String firstName,
    required String middleName,
    required String lastName,
    required String phoneNumber,
    required String birthDate,
    required String address,
    required String gender,
    required String bloodType,
    required String maritalStatus,
    required String proffesion,
    required String age,
    required int diabetes,
    required int bloodPressure,
    required int wallet,
    String? description,
    String? habits,
    Uint8List? image,
    int? childrenNum,
  }) async {
    try {
      final response = await _authRemoteDataSource.register(
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        address: address,
        gender: gender,
        bloodType: bloodType,
        maritalStatus: maritalStatus,
        proffesion: proffesion,
        diabetes: diabetes,
        bloodPressure: bloodPressure,
        wallet: wallet,
        age: age,
        habits: habits,
        childrenNum: childrenNum,
        description: description,
        image: image,
      );
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
