// To parse this JSON data, do
//
//     final SignUpResponseModel = SignUpResponseModelFromJson(jsonString);
class SignUpResponseModel {
  SignUpResponseModel({
    this.id,
    this.email,
    this.username,
    this.phone,
    this.qrCode,
    this.isSeller,
    this.cashbackAll,
    this.isActive,
    this.response,
    this.token,
    this.code,
  });

  int? id;
  String? email;
  String? username;
  String? phone;
  String? qrCode;
  bool? isSeller;
  String? cashbackAll;
  bool? isActive;
  String? response;
  String? token;
  int? code;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : json["username"],
        phone: json["phone"] == null ? null : json["phone"],
        qrCode: json["qr_code"] == null ? null : json["qr_code"],
        isSeller: json["is_seller"] == null ? null : json["is_seller"],
        cashbackAll: json["cashback_all"] == null ? null : json["cashback_all"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        response: json["response"] == null ? null : json["response"],
        token: json["token"] == null ? null : json["token"],
        code: json["code"] == null ? null : json["code"],
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
        "response": response == null ? null : response,
        "token": token == null ? null : token,
        "code": code == null ? null : code,
      };
}
