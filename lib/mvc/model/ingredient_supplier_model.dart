// To parse this JSON data, do
//
//     final ingredineSupplierModel = ingredineSupplierModelFromJson(jsonString);

import 'dart:convert';

IngredineSupplierModel ingredineSupplierModelFromJson(String str) => IngredineSupplierModel.fromJson(json.decode(str));

String ingredineSupplierModelToJson(IngredineSupplierModel data) => json.encode(data.toJson());

class IngredineSupplierModel {
  IngredineSupplierModel({
    required this.data,
  });

  List<Datum> data;

  factory IngredineSupplierModel.fromJson(Map<String, dynamic> json) => IngredineSupplierModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.reference,
    required this.address,
    required this.idCardFront,
    required this.idCardBack,
    this.status,
  });

  int id;
  String name;
  String email;
  String phone;
  String reference;
  String address;
  String idCardFront;
  String idCardBack;
  dynamic status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    reference: json["reference"],
    address: json["address"],
    idCardFront: json["id_card_front"],
    idCardBack: json["id_card_back"],
    status: json["status"]==null?"": json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "reference": reference,
    "address": address,
    "id_card_front": idCardFront,
    "id_card_back": idCardBack,
    "status": status,
  };
}
