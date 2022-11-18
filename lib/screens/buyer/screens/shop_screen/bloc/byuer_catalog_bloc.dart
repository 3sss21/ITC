import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/category_seller_model.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/bloc/seller_catalog_repository.dart';
import 'package:meta/meta.dart';
part 'byuer_catalog_event.dart';
part 'byuer_catalog_state.dart';

class BuyerCatalogBloc extends Bloc<BuyerCatalogEvent, BuyerCatalogState> {
  BuyerCatalogBloc() : super(BuyerCatalogInitial()) {
    on<BuyerCatalogEvent>((event, emit) async {

      if (event is GetCatalogEvent) {
        emit(CatalogBuyerLoadingState());

        try {
          List<CategorySellerModel> catallogBuyerModelList =
              await CatalogRepository().getCatallogSeller();

          emit(CatalogBuyerFetchedState(
              catalogBuyerModel: catallogBuyerModelList));
        } catch (e) {
          emit(CatlaogBuyerErrorState(
              error: CatchException.convertException(e)));
        }
      }
    });
  }
}
