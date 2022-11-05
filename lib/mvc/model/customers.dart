// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customers customerFromJson(String str) => Customers.fromJson(json.decode(str));

String customerToJson(Customers data) => json.encode(data.toJson());

class Customers {
  Customers({
    this.data,
  });

  List<Datum>? data;

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
