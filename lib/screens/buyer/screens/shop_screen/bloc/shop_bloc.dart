import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/catalog_model.dart';
import 'package:meta/meta.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopInitial()) {
    on<ShopEvent>((event, emit) {
      if (event is GetShopEvent) {
        emit(LoadingShopState());
        try {
          List<CatalogProductModel> catalogProductModelList = [
            CatalogProductModel(
              name: 'Кофе',
            ),
            CatalogProductModel(
              name: 'Кофе',
            ),
            CatalogProductModel(
              name: 'Кофе',
            ),
            CatalogProductModel(
              name: 'Кофе',
            ),
            CatalogProductModel(
              name: 'Кофе',
            ),
            CatalogProductModel(
              name: 'Кофе',
            ),
            CatalogProductModel(
              name: 'Кофе',
            ),
            CatalogProductModel(
              name: 'Кофе',
            ),
          ];
          emit(LoadedShopState(catalogProductModelList: catalogProductModelList));
        } catch (e) {
          emit(ErrorShopState(message: CatchException.convertException(e)));
        }
      }
    });
  }
}
