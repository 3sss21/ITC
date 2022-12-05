// To parse this JSON data, do
//
//     final BranchModel = BranchModelFromJson(jsonString);

import 'dart:convert';

class BranchModel {
  BranchModel({
    this.id,
    this.listCategories,
    this.name,
    this.address,
    this.user,
  });

  int? id;
  List<ListCategory>? listCategories;
  String? name;
  String? address;
  int? user;

  factory BranchModel.fromRawJson(String str) =>
      BranchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        id: json["id"] == null ? null : json["id"],
        listCategories: json["list_categories"] == null
            ? null
            : List<ListCategory>.from(
                json["list_categories"].map((x) => ListCategory.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        user: json["user"] == null ? null : json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "list_categories": listCategories == null
            ? null
            : List<dynamic>.from(listCategories!.map((x) => x.toJson())),
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "user": user == null ? null : user,
      };
}

class ListCategory {
  ListCategory({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory ListCategory.fromRawJson(String str) =>
      ListCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListCategory.fromJson(Map<String, dynamic> json) => ListCategory(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
