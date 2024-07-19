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


