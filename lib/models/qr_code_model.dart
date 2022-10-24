// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

class CharacterModel {
    CharacterModel({
        this.id,
        this.email,
        this.username,
        this.phone,
        this.qrCode,
        this.isSeller,
        this.cashbackAll,
        this.isActive,
    });

    int? id;
    String? email;
    String? username;
    String? phone;
    String? qrCode;
    bool? isSeller;
    String? cashbackAll;
    bool? isActive;

    factory CharacterModel.fromRawJson(String str) => CharacterModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : json["username"],
        phone: json["phone"] == null ? null : json["phone"],
        qrCode: json["qr_code"] == null ? null : json["qr_code"],
        isSeller: json["is_seller"] == null ? null : json["is_seller"],
        cashbackAll: json["cashback_all"] == null ? null : json["cashback_all"],
        isActive: json["is_active"] == null ? null : json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "username": username == null ? null : username,
        "phone": phone == null ? null : phone,
        "qr_code": qrCode == null ? null : qrCode,
        "is_seller": isSeller == null ? null : isSeller,
        "cashback_all": cashbackAll == null ? null : cashbackAll,
        "is_active": isActive == null ? null : isActive,
    };
}
