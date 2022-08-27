part of 'seller_catalog_bloc.dart';

@immutable
abstract class SellerCatalogState {}

class SellerCatalogInitial extends SellerCatalogState {}

class CatalogSellerFetchedState extends SellerCatalogState {
  final List<CategorySellerModel> catalogSellerModel;

  CatalogSellerFetchedState({required this.catalogSellerModel});
}

class CatalogSellerLoadingState extends SellerCatalogState {}

class CatlaogSellerErrorState extends SellerCatalogState {
  final CatchException error;

  CatlaogSellerErrorState({required this.error});
}
