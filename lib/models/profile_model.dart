// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

class ProfileModel {
    ProfileModel({
        this.id,
        this.email,
        this.username,
        this.phone,
        this.qrCode,
        this.absoluteUrl,
        this.isSeller,
        this.cashbackAll,
    });

    int? id;
    String? email;
    String? username;
    String? phone;
    String? qrCode;
    String? absoluteUrl;
    bool? isSeller;
    String? cashbackAll;

    factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : json["username"],
        phone: json["phone"] == null ? null : json["phone"],
        qrCode: json["qr_code"] == null ? null : json["qr_code"],
        absoluteUrl: json["absolute_url"] == null ? null : json["absolute_url"],
        isSeller: json["is_seller"] == null ? null : json["is_seller"],
        cashbackAll: json["cashback_all"] == null ? null : json["cashback_all"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "username": username == null ? null : username,
        "phone": phone == null ? null : phone,
        "qr_code": qrCode == null ? null : qrCode,
        "absolute_url": absoluteUrl == null ? null : absoluteUrl,
        "is_seller": isSeller == null ? null : isSeller,
        "cashback_all": cashbackAll == null ? null : cashbackAll,
    };
}
