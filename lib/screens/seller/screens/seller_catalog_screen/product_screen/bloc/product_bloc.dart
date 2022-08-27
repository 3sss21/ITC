import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/seller_catalog.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/product_screen/bloc/seller_product_repository.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProductEvent) {
        emit(ProductSellerLoadingState());

        try {
          List<CatalogSeller> catallogSellerModelList =
              await ProductRepository().getProductSeller();

          emit(ProductSellerFetchedState(
              productSellerModel: catallogSellerModelList));
        } catch (e) {
          emit(ProductSellerErrorState(
              error: CatchException.convertException(e)));
        }
      }
    });
  }
}
