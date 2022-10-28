// To parse this JSON data, do
//
//     final signInResponseModel = signInResponseModelFromJson(jsonString);

import 'dart:convert';

class SignInResponseModel {
  SignInResponseModel({
    this.authToken,
  });

  String? authToken;

  factory SignInResponseModel.fromRawJson(String str) =>
      SignInResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        authToken: json["auth_token"] == null ? null : json["auth_token"],
      );

  Map<String, dynamic> toJson() => {
        "auth_token": authToken == null ? null : authToken,
      };
}
