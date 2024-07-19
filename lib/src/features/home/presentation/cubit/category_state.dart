part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategorySelected extends CategoryState {
  final int selectedIndex;

  const CategorySelected(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
