// To parse this JSON data, do
//
//     final branchModel = branchModelFromJson(jsonString);

import 'dart:convert';

class BranchModel {
    BranchModel({
        this.id,
        this.branchStorage,
        this.user,
        this.name,
        this.address,
        this.slug,
    });

    int? id;
    List<BranchStorage>? branchStorage;
    String? user;
    String? name;
    String? address;
    String? slug;

    factory BranchModel.fromRawJson(String str) => BranchModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        id: json["id"] == null ? null : json["id"],
        branchStorage: json["branch_storage"] == null ? null : List<BranchStorage>.from(json["branch_storage"].map((x) => BranchStorage.fromJson(x))),
        user: json["user"] == null ? null : json["user"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        slug: json["slug"] == null ? null : json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "branch_storage": branchStorage == null ? null : List<dynamic>.from(branchStorage!.map((x) => x.toJson())),
        "user": user == null ? null : user,
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "slug": slug == null ? null : slug,
    };
}

class BranchStorage {
    BranchStorage({
        this.id,
        this.product,
        this.amount,
        this.branch,
    });

    int? id;
    int? product;
    int? amount;
    int? branch;

    factory BranchStorage.fromRawJson(String str) => BranchStorage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BranchStorage.fromJson(Map<String, dynamic> json) => BranchStorage(
        id: json["id"] == null ? null : json["id"],
        product: json["product"] == null ? null : json["product"],
        amount: json["amount"] == null ? null : json["amount"],
        branch: json["branch"] == null ? null : json["branch"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product": product == null ? null : product,
        "amount": amount == null ? null : amount,
        "branch": branch == null ? null : branch,
    };
}
