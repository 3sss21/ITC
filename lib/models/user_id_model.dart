// To parse this JSON data, do
//
//     final userIdModel = userIdModelFromMap(jsonString);

import 'dart:convert';

class UserIdModel {
    UserIdModel({
        this.username,
        this.email,
        this.isSeller,
        this.id,
        this.phone,
    });

    String? username;
    String? email;
    bool? isSeller;
    int? id;
    String? phone;

    factory UserIdModel.fromJson(String str) => UserIdModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserIdModel.fromMap(Map<String, dynamic> json) => UserIdModel(
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        isSeller: json["is_seller"] == null ? null : json["is_seller"],
        id: json["id"] == null ? null : json["id"],
        phone: json["phone"] == null ? null : json["phone"],
    );

    Map<String, dynamic> toMap() => {
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "is_seller": isSeller == null ? null : isSeller,
        "id": id == null ? null : id,
        "phone": phone == null ? null : phone,
    };
}
