part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class LoadingCategoryState extends CategoryState {}

class LoadedCategoryState extends CategoryState {
  final CategorySellerModel categorySellerModel;

  LoadedCategoryState({required this.categorySellerModel});
}

class ErrorCategoryState extends CategoryState {
  final CatchException message;

  ErrorCategoryState({required this.message});
}
