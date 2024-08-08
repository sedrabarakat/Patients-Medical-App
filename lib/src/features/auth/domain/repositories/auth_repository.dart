import 'package:dartz/dartz.dart';
import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/data/models/user_model.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/auth/data/data_source/remote/auth_remote_data_source.dart';

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

  Future<Either<NetworkExceptions, BaseModel<PersonalInformationModel>>>
      verifyCode(String phoneNumber, String code) async {
    try {
      final response =
          await _authRemoteDataSource.verifiyCode(phoneNumber, code);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
