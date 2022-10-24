// To parse this JSON data, do
//
//     final confirmModel = confirmModelFromJson(jsonString);

import 'dart:convert';

ConfirmModel confirmModelFromJson(String str) => ConfirmModel.fromJson(json.decode(str));

String confirmModelToJson(ConfirmModel data) => json.encode(data.toJson());

class ConfirmModel {
    ConfirmModel({
        this.code,
        this.email,
    });

    List<String> ?code;
    List<String> ?email;

    factory ConfirmModel.fromJson(Map<String, dynamic> json) => ConfirmModel(
        code: json["code"] == null ? null : List<String>.from(json["code"].map((x) => x)),
        email: json["email"] == null ? null : List<String>.from(json["email"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : List<dynamic>.from(code!.map((x) => x)),
        "email": email == null ? null : List<dynamic>.from(email!.map((x) => x)),
    };
}
