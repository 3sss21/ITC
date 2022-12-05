import 'package:cashback_app/global_blocs/product_bloc/product_provider.dart';
import 'package:cashback_app/models/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> getProduct(int categoryId) {
    ProductProvider provider = ProductProvider();

    return provider.getProduct(categoryId);
  }
}
