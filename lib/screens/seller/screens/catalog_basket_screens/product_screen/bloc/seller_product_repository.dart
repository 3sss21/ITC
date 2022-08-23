import 'package:cashback_app/models/category_seller_model.dart';
import 'package:cashback_app/models/seller_catalog.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/bloc/seller_catalog_provider.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/product_screen/bloc/seller_product_provider.dart';

class ProductRpepository {
  Future<List<CatalogSeller>> getProductSeller() {
    ProductSellerProvider provider = ProductSellerProvider();

    return provider.getProductSeller();
  }
}
