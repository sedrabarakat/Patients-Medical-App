import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/doctor.dart';
import '../../domain/repositories/doctor_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DoctorRepository doctorRepository;
  int selectedSection = 0;
  HomeCubit(this.doctorRepository) : super(HomeInitial());
  void fetchDoctor() async {
    try {
      emit(LoadingHome());
      final doctors = await doctorRepository.getDoctor();
      emit(LoadedHome(doctors));
    } catch (e) {
      emit(ErrorHome(e.toString()));
    }
  }


}
