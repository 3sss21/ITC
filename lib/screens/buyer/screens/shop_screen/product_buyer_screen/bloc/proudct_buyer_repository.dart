import 'package:cashback_app/models/seller_catalog.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/product_buyer_screen/bloc/product_buyer_provider.dart';

class ProductBuyerRpepository {
  Future<List<CatalogSeller>> getProductBuyer() {
    ProductBuyerProvider provider = ProductBuyerProvider();

    return provider.getProductBuyer();
  }
}
