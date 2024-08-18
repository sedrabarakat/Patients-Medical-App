part of'home_cubit.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class LoadingHome extends HomeState{}

final class LoadedHome extends HomeState{
  final List<Doctor> doctors ;

  LoadedHome(this.doctors);
  @override
  List<Object> get props => [doctors] ;



}

final class ErrorHome extends HomeState{
  final String message ;

  ErrorHome(this.message);
  @override
  List<Object> get props => [message];
}

class SectionCategorySelected extends HomeState{
  final int selectedSectionCategoryIndex ;

  SectionCategorySelected(this.selectedSectionCategoryIndex);

  @override
  List<Object> get props => [selectedSectionCategoryIndex] ;
}
class Loading_getPatientInfo extends HomeState{}
class Success_getPatientInfo extends HomeState{
  final PatientModel patientModel ;

  Success_getPatientInfo(this.patientModel);
}
class Error_getPatientInfo extends HomeState{}

class GetSectionsLoadingState extends HomeState {}

class GetSectionsSuccessState extends HomeState {
  final List<SectionModel> sections;
  GetSectionsSuccessState(this.sections);
}

class GetSectionsErrorState extends HomeState {
  final NetworkExceptions error;
  GetSectionsErrorState(this.error);
}

class GetSectionInformationLoadingState extends HomeState {}

class GetSectionInformationErrorState extends HomeState {
  final NetworkExceptions error;
  GetSectionInformationErrorState(this.error);
}

class GetSectionInformationSuccessState extends HomeState {
  final SectionModel section;
  GetSectionInformationSuccessState(this.section);
}

class GetSlidersLoadingState extends HomeState {}

class GetSlidersSuccessState extends HomeState {
  final List<SliderModel> sliders;
  GetSlidersSuccessState(this.sliders);
}

class GetSlidersErrorState extends HomeState {
  final NetworkExceptions error;
  GetSlidersErrorState(this.error);
}



