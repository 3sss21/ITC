import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:meta/meta.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    on<CatalogEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
