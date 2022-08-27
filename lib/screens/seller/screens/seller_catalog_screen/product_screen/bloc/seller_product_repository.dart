import 'package:cashback_app/models/seller_catalog.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/product_screen/bloc/seller_product_provider.dart';

class ProductRepository {
  Future<List<CatalogSeller>> getProductSeller() {
    ProductSellerProvider provider = ProductSellerProvider();

    return provider.getProductSeller();
  }
}
