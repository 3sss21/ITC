// // To parse this JSON data, do
//
//     final userIdModel = userIdModelFromJson(jsonString);

import 'dart:convert';

class UserIdModel {
  UserIdModel({
    this.username,
    this.isSeller,
    this.id,
    this.email,
  });

  String? username;
  bool? isSeller;
  int? id;
  String? email;

  factory UserIdModel.fromRawJson(String str) =>
      UserIdModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserIdModel.fromJson(Map<String, dynamic> json) => UserIdModel(
        username: json["username"] == null ? null : json["username"],
        isSeller: json["is_seller"] == null ? null : json["is_seller"],
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "is_seller": isSeller == null ? null : isSeller,
        "id": id == null ? null : id,
        "email": email == null ? null : email,
      };
}
