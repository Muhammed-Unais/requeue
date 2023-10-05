import 'dart:convert';

UserModel userModelFromJson(String str) {
  final jsonData = json.decode(str);
  return UserModel.fromJson(jsonData);
}

class UserModel {
  String? message;
  User? user;
  String? token;

  UserModel({
    this.message,
    required this.user,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );
}

class User {
  String? clientName;
  String? mail;
  int? country;
  bool? clientStatus;
  String? clientPhone;
  dynamic clientGender;
  int? clientId;

  User({
    this.clientName,
    this.mail,
    this.country,
    this.clientStatus,
    this.clientPhone,
    this.clientGender,
    this.clientId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        clientName: json["client_name"],
        mail: json["mail"],
        country: json["country"],
        clientStatus: json["client_status"],
        clientPhone: json["client_phone"],
        clientGender: json["client_gender"],
        clientId: json["client_id"],
      );
}
