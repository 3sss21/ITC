// To parse this JSON data, do
//
//     final confirmResponseModel = confirmResponseModelFromJson(jsonString);

import 'dart:convert';

class ConfirmResponseModel {
  ConfirmResponseModel({
    this.message,
  });

  String? message;

  factory ConfirmResponseModel.fromRawJson(String str) =>
      ConfirmResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ConfirmResponseModel.fromJson(Map<String, dynamic> json) =>
      ConfirmResponseModel(
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
      };
}
