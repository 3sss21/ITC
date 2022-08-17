// To parse this JSON data, do
//
//     final categorySellerModel = categorySellerModelFromJson(jsonString);

import 'dart:convert';

List<CategorySellerModel> categorySellerModelFromJson(String str) =>
    List<CategorySellerModel>.from(
        json.decode(str).map((x) => CategorySellerModel.fromJson(x)));

String categorySellerModelToJson(List<CategorySellerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategorySellerModel {
  CategorySellerModel({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory CategorySellerModel.fromJson(Map<String, dynamic> json) =>
      CategorySellerModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
      };
}
