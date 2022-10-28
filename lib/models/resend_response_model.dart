// To parse this JSON data, do
//
//     final resendResponseModel = resendResponseModelFromJson(jsonString);

import 'dart:convert';

class ResendResponseModel {
  ResendResponseModel({
    this.id,
    this.code,
    this.message,
  });

  int? id;
  int? code;
  String? message;

  factory ResendResponseModel.fromRawJson(String str) =>
      ResendResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResendResponseModel.fromJson(Map<String, dynamic> json) =>
      ResendResponseModel(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "message": message == null ? null : message,
      };
}
