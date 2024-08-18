import 'package:dartz/dartz.dart';
import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/favoriate/data/fav_remote/fav_remote.dart';

class FaveRepo {
  FavRemote favRemote;
  FaveRepo(this.favRemote);

  Future<Either<NetworkExceptions, List<DoctorModel>>> getFav() async {
    try {
      List<DoctorModel> list = [];
      BaseModel baseModel = await favRemote.getFav();

      for (int i = 0; i < baseModel.data.length; i++) {
        DoctorModel doctorModel = DoctorModel.fromJson(baseModel.data[i]);
        list.add(doctorModel);
      }

      return right(list);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> toggleFav(
      {required int id}) async {
    try {
      BaseModel baseModel = await favRemote.ToggleFave(id: id);
      return right(baseModel);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
