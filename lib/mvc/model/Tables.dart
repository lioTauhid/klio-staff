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
    this.name,
    this.number,
    this.capacity,
    this.available,
    this.image,
  });

  String? name;
  String? number;
  int? capacity;
  int? available;
  String? image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    number: json["number"],
    capacity: json["capacity"],
    available: json["available"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "number": number,
    "capacity": capacity,
    "available": available,
    "image": image,
  };
}
