part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProductEvent extends ProductEvent {
  final int categoryId;

  GetProductEvent({required this.categoryId});
}
