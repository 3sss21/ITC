part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState {}

class CatalogInitial extends CatalogState {}


class CatalogterFetchedState extends CatalogState {
  
}

class CatalogLoadingState extends CatalogState {}


class CatalogErrorState extends CatalogState {
   final CatchException error;
  CatalogErrorState({required this.error});
}