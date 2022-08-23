// To parse this JSON data, do
//
//     final catalogSeller = catalogSellerFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CatalogSeller> catalogSellerFromJson(String str) =>
    List<CatalogSeller>.from(
        json.decode(str).map((x) => CatalogSeller.fromJson(x)));

String catalogSellerToJson(List<CatalogSeller> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatalogSeller {
  CatalogSeller({
    this.id,
    this.category,
    this.typeProduct,
    this.title,
    this.slug,
    this.image,
    this.description,
    this.price,
    this.date,
    this.percentCashback,
  });

  int? id;
  String? category;
  String? typeProduct;
  String? title;
  String? slug;
  String? image;
  String? description;
  String? price;
  DateTime? date;
  String? percentCashback;

  factory CatalogSeller.fromJson(Map<String, dynamic> json) => CatalogSeller(
        id: json["id"] == null ? null : json["id"],
        category: json["category"] == null ? null : json["category"],
        typeProduct: json["type_product"] == null ? null : json["type_product"],
        title: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        percentCashback:
            json["percent_cashback"] == null ? null : json["percent_cashback"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category": category == null ? null : category,
        "type_product": typeProduct == null ? null : typeProduct,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "image": image == null ? null : image,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "percent_cashback": percentCashback == null ? null : percentCashback,
      };

  @override
  String toString() {
    return 'id: $id, category: $category, typeProduct:$typeProduct, title: $title, slug: $slug, image: $image, description: $description price: $price, date: $date, percentCashback: $percentCashback';
  }
}



