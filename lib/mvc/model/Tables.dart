// To parse this JSON data, do
//
//     final tables = tablesFromJson(jsonString);

import 'dart:convert';

TableList tablesFromJson(String str) => TableList.fromJson(json.decode(str));

String tablesToJson(TableList data) => json.encode(data.toJson());

class TableList {
  TableList({
    this.data,
  });

  List<Datum>? data;

  factory TableList.fromJson(Map<String, dynamic> json) => TableList(
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
    this.number,
    this.capacity,
    this.available,
    this.image,
    this.message,
    this.person,
  });

  int? id;
  String? name;
  String? number;
  int? capacity;
  int? available;
  String? image;
  String? message;
  String? person;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    number: json["number"],
    capacity: json["capacity"],
    available: json["available"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "number": number,
    "capacity": capacity,
    "available": available,
    "image": image,
    "message": message,
    "person": person,
  };
}
