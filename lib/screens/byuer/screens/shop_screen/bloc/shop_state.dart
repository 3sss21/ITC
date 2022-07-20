part of 'shop_bloc.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class LoadingShopState extends ShopState {}

class LoadedShopState extends ShopState {
  final List<CatalogProductModel> catalogProductModelList;

  LoadedShopState({required this.catalogProductModelList});
}

class ErrorShopState extends ShopState {
  final CatchException? message;

  ErrorShopState({required this.message});
}
