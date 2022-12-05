part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductFetchedState extends ProductState {
  final List<ProductModel> listOfProduct;

  ProductFetchedState({required this.listOfProduct});
}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {
  final CatchException error;

  ProductErrorState({required this.error});
}
