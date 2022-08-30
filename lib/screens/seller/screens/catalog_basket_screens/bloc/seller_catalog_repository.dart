import 'package:cashback_app/models/category_seller_model.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/bloc/seller_catalog_provider.dart';

class CatalogRpepository{
  Future<List<CategorySellerModel>> getCatallogSeller(){
    CatallogSellerProvider provider = CatallogSellerProvider();
    
    return provider.getCatallogSeller();
  }
}