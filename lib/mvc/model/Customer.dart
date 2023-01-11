// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer cusFromJson(String str) => Customer.fromJson(json.decode(str));

String cusToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    this.data,
  });

  Data? data;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.deliveryAddress,
    this.noOfVisit,
    this.lastVisit,
    this.pointsAcquired,
    this.usedPoints,
  });

  int ?id;
  String? name;
  String ?email;
  String? phone;
  String ?deliveryAddress;
  int? noOfVisit;
  String ?lastVisit;
  int? pointsAcquired;
  dynamic usedPoints;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? '',
    name: json["name"] ?? '',
    email: json["email"] ?? '',
    phone: json["phone"] ?? '',
    deliveryAddress: json["delivery_address"] ?? '',
    noOfVisit: json["no_of_visit"] ?? '',
    lastVisit: json["last_visit"] ?? '',
    pointsAcquired: json["points_acquired"] ?? '',
    usedPoints: json["used_points"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "delivery_address": deliveryAddress,
    "no_of_visit": noOfVisit,
    "last_visit": lastVisit,
    "points_acquired": pointsAcquired,
    "used_points": usedPoints,
  };
}