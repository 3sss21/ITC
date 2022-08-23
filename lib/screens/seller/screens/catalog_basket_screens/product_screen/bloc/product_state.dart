part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductSellerFetchedState extends ProductState {
  final List<CatalogSeller> productSellerModel;

  ProductSellerFetchedState({required this.productSellerModel});
}

class ProductSellerLoadingState extends ProductState {}

class ProductSellerErrorState extends ProductState {
  final CatchException error;

  ProductSellerErrorState({required this.error});
}
