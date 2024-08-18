import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/src/features/favoriate/presentation/cubit/fav_states.dart';

import '../../data/fav_repo/fave_repo.dart';

class FavCubit extends Cubit<FavStates> {
  FaveRepo faveRepo;

  FavCubit(this.faveRepo) : super(Init_FavStates());

  static FavCubit get(context) => BlocProvider.of(context);

  List<DoctorModel> list = [];
  Future<void> getFav() async {
    emit(Loading_getFav_State());
    await faveRepo.getFav().then((value) {
      value.fold((error) {
        emit(Error_getFav_State());
      }, (value) {
        list = value;
        emit(Success_getFav_State());
      });
    });
  }

  Future<void> toggleFav({required DoctorModel likedDoctor}) async {
    emit(Success_ToggleFav_State());
    await faveRepo.toggleFav(id: likedDoctor.id).then((value) {
      value.fold((error) {
        emit(Error_ToggleFav_State());
      }, (value) {
        list.add(likedDoctor);
        emit(Success_getFav_State());
      });
    });
  }
}
