import 'package:bloc/bloc.dart';
import 'package:cashback_app/global_blocs/product_bloc/product_repository.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProductEvent) {
        emit(ProductLoadingState());

        try {
          List<ProductModel> listOfProduct =
              await ProductRepository().getProduct(event.categoryId);

          emit(ProductFetchedState(listOfProduct: listOfProduct));
        } catch (e) {
          emit(ProductErrorState(error: CatchException.convertException(e)));
        }
      }
    });
  }
}
