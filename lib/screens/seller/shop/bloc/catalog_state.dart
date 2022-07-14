part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogLoadingState extends CatalogState {}

class CatalogterFetchedState extends CatalogState {
  List<CatalogModel> catalogList;

  CatalogterFetchedState({required this.catalogList});
}

class CatalogErrorState extends CatalogState {
  final CatchException error;

  CatalogErrorState({required this.error});
}
