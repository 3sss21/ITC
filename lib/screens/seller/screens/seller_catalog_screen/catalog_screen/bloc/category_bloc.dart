import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/hive_models/user_data.dart';
import 'package:cashback_app/models/category_seller_model.dart';
import 'package:cashback_app/models/user_data_model.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/catalog_screen/bloc/category_repository.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<GetCategoryEvent>(
      (event, emit) async {
        emit(LoadingCategoryState());
        try {
          CategorySellerModel categorySellerModel =
              await CategoryRepository().getCategory();

          emit(
            LoadedCategoryState(categorySellerModel: categorySellerModel),
          );
        } catch (e) {
          emit(
            ErrorCategoryState(
              message: CatchException.convertException(e),
            ),
          );
        }
      },
    );
  }
}
