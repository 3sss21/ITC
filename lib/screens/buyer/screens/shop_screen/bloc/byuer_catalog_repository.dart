import 'package:cashback_app/models/category_seller_model.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/bloc/byuer_catalog_provider.dart';

class CatalogRpepository{
  Future<List<CategorySellerModel>> getCatallogByuer(){
    CatallogBuyerProvider provider = CatallogBuyerProvider();
    
    return provider.getCatallogBuyer();
  }
}