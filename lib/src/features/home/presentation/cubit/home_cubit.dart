import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/src/features/home/data/model/slider_model.dart';
import '../../../../../core/data/models/patient_model.dart';
import '../../../../../core/data/models/section_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/model/doctor.dart';
import '../../domain/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  int selectedSection = 0;
  HomeCubit(this.homeRepository) : super(HomeInitial());

  SectionModel? sectionDetails;

  static PatientModel ?patientModel;
  Future<void>getPatientInfo()async{
   emit(Loading_getPatientInfo());
    await homeRepository.getPatientInfo().then((value){
      value.fold((error){
        debugPrint(error.toString());
       emit(Error_getPatientInfo());
      }, (patientModelData){
        patientModel=patientModelData;
        emit(Success_getPatientInfo(patientModelData));
      });
    });
  }

  List<SectionModel> sections =[] ;
  Future<void> getSections() async {
    emit(GetSectionsLoadingState());
    final response = await homeRepository.getSections();
    response.fold((e) {
      emit(GetSectionsErrorState(e));
    }, (data) {
      sections =
      data.list.map((section) => section as SectionModel).toList();
      emit(GetSectionsSuccessState(sections));
    });
  }

  int? previousId;
  Future<void> getSectionInformation(int id) async {
    // this condition to prevent fetching data when every time the screen is rebuild
    if (previousId == null) {
      previousId = id;
    } else if (previousId == id) {
      return;
    } else {
      previousId = id;
    }
    emit(GetSectionInformationLoadingState());
    final response = await homeRepository.getSectionInformation(id);
    response.fold((e) => emit(GetSectionInformationErrorState(e)), (data) {
      sectionDetails = data.data;
      emit(
        GetSectionInformationSuccessState(data.data!),
      );
    });
  }


  List<SliderModel> sliders =[] ;
  Future<void> getSliders() async {
    emit(GetSlidersLoadingState());
    final response = await homeRepository.getSliders();
    response.fold((e) {
      emit(GetSlidersErrorState(e));
    }, (data) {
      sliders =
          data.list.map((slider) => slider as SliderModel).toList();
      emit(GetSlidersSuccessState(sliders));
    });
  }




}
