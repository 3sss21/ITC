class CatalogProductModel {
  int? id;
  String? category;
  String? typeProduct;
  String? name;
  String? slug;
  String? image;
  String? description;
  double? price;
  double? percentCashback;
  DateTime? dateTime;

  CatalogProductModel({
    this.id,
    this.category,
    this.typeProduct,
    this.name,
    this.slug,
    this.image,
    this.description,
    this.price,
    this.percentCashback,
    this.dateTime,
  });
}

// class ListOfProducts extends CatalogProductModel {
//   String? category;
//   List<dynamic>? listOO = [listProducts];

//   ListOfProducts(
//     {
//       this.category,
//       this.list,
//     }
//   );
//   List<dynamic> listProducts = [
//     CatalogProductModel()
//     ..category..dateTime..description..id..image..name..percentCashback..price..typeProduct
    
//   ];
//   // Map<String, dynamic>? mapList = {
//   //   'id': int,
//   //   'typeProduct': String,
//   //   'name': String,
//   //   'slug': String,
//   //   'image': String,
//   //   'description': String,
//   //   'price': double,
//   //   'persentCashback': double,
//   //   'dateTime': DateTime,
//   // };
// }

// // class ShopModel{

// // }


