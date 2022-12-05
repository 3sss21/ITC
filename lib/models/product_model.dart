// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

class ProductModel {
  ProductModel({
    this.id,
    this.category,
    this.typeProduct,
    this.title,
    this.image,
    this.description,
    this.price,
    this.date,
    this.percentCashback,
  });

  int? id;
  Category? category;
  int? typeProduct;
  String? title;
  String? image;
  String? description;
  String? price;
  DateTime? date;
  String? percentCashback;

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] == null ? null : json["id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        typeProduct: json["type_product"] == null ? null : json["type_product"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        percentCashback:
            json["percent_cashback"] == null ? null : json["percent_cashback"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category": category == null ? null : category!.toJson(),
        "type_product": typeProduct == null ? null : typeProduct,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "percent_cashback": percentCashback == null ? null : percentCashback,
      };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
