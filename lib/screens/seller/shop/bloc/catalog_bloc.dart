import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/catalog_model.dart';
import 'package:meta/meta.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    on<CatalogEvent>((event, emit) {
      if (event is GetAllProductsEvent) {
        emit(CatalogLoadingState());

        try {
          List<CatalogProductModel> catalogList = [
            CatalogProductModel(name: 'Кофе'),
            CatalogProductModel(name: 'Кофе2'),
            CatalogProductModel(name: 'Кофе33'),
            CatalogProductModel(name: 'Кофе44'),
            CatalogProductModel(name: 'Кофе55'),
            CatalogProductModel(name: 'Кофе77'),
          ];

          emit(CatalogterFetchedState(catalogList: catalogList));
        } catch (e) {
          emit(CatalogErrorState(error: CatchException.convertException(e)));
        }
      }
    });
  }
}
