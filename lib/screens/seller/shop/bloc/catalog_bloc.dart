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
          List<CatalogModel> catalogList = [
            CatalogModel(name: 'Кофе'),
            CatalogModel(name: 'Кофе2'),
            CatalogModel(name: 'Кофе33'),
            CatalogModel(name: 'Кофе44'),
            CatalogModel(name: 'Кофе55'),
            CatalogModel(name: 'Кофе77'),
          ];

          emit(CatalogterFetchedState(catalogList: catalogList));
        } catch (e) {
          emit(CatalogErrorState(error: CatchException.convertException(e)));
        }
      }
    });
  }
}
