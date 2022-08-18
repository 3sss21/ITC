import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/seller_catalog.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/product_buyer_screen/bloc/proudct_buyer_repository.dart';
import 'package:meta/meta.dart';

part 'product_buyer_event.dart';
part 'product_buyer_state.dart';

class ProductBuyerBloc extends Bloc<ProductBuyerEvent, ProductBuyerState> {
  ProductBuyerBloc() : super(ProductBuyerInitial()) {
    on<ProductBuyerEvent>((event, emit) async {
       if (event is GetProductBuyerEvent) {
        emit(ProductBuyerLoadingState());

        try {
          List<CatalogSeller> catallogSellerModelList =
              await ProductBuyerRpepository().getProductBuyer();

          emit(ProductByuerFetchedState(
              productBuyerModel: catallogSellerModelList));
        } catch (e) {
          emit(ProductBuyerErrorState(
              error: CatchException.convertException(e)));
        }
      }
    });
  }
}
