// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.data,
  });

  Data? data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.image,
    this.ipAddress,
    this.lastLogin,
    this.permissions,
  });

  String? name;
  String? email;
  dynamic phone;
  String? address;
  String? image;
  String? ipAddress;
  DateTime? lastLogin;
  List<String>? permissions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    image: json["image"],
    ipAddress: json["ip_address"],
    lastLogin: DateTime.parse(json["last_login"]),
    permissions: List<String>.from(json["permissions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "image": image,
    "ip_address": ipAddress,
    "last_login": lastLogin!.toIso8601String(),
    "permissions": List<dynamic>.from(permissions!.map((x) => x)),
  };
}
