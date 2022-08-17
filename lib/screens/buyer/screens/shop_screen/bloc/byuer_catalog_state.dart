part of 'byuer_catalog_bloc.dart';

@immutable
abstract class BuyerCatalogState {}

class BuyerCatalogInitial extends BuyerCatalogState {}

class CatalogBuyerFetchedState extends BuyerCatalogState {
  final List<CategorySellerModel> catalogBuyerModel;

  CatalogBuyerFetchedState({required this.catalogBuyerModel});
}

class CatalogBuyerLoadingState extends BuyerCatalogState {}

class CatlaogBuyerErrorState extends BuyerCatalogState {
  final CatchException error;

  CatlaogBuyerErrorState({required this.error});
}
