part of 'product_buyer_bloc.dart';

@immutable
abstract class ProductBuyerState {}

class ProductBuyerInitial extends ProductBuyerState {}


class ProductByuerFetchedState extends ProductBuyerState {
  final List<CatalogSeller> productBuyerModel;

  ProductByuerFetchedState({required this.productBuyerModel});
}

class ProductBuyerLoadingState extends ProductBuyerState {}

class ProductBuyerErrorState extends ProductBuyerState {
  final CatchException error;

  ProductBuyerErrorState({required this.error});
}
