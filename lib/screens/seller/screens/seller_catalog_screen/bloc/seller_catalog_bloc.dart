import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/category_seller_model.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/bloc/seller_catalog_repository.dart';
import 'package:meta/meta.dart';
part 'seller_catalog_event.dart';
part 'seller_catalog_state.dart';

class SellerCatalogBloc extends Bloc<SellerCatalogEvent, SellerCatalogState> {
  SellerCatalogBloc() : super(SellerCatalogInitial()) {
    on<SellerCatalogEvent>((event, emit) async {

      if (event is GetCatalogEvent) {
        emit(CatalogSellerLoadingState());

        try {
          List<CategorySellerModel> catallogSellerModelList =
              await CatalogRepository().getCatallogSeller();

          emit(CatalogSellerFetchedState(
              catalogSellerModel: catallogSellerModelList));
        } catch (e) {
          emit(CatalogSellerErrorState(
              error: CatchException.convertException(e)));
        }
      }
    });
  }
}
