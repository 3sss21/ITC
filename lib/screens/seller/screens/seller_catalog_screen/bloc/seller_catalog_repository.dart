import 'package:cashback_app/models/category_seller_model.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/bloc/seller_catalog_provider.dart';

class CatalogRepository{
  Future<List<CategorySellerModel>> getCatallogSeller(){
    CatallogSellerProvider provider = CatallogSellerProvider();
    
    return provider.getCatallogSeller();
  }
}