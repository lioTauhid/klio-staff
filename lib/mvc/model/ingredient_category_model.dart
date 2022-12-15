// To parse this JSON data, do
//
//     final ingredineCategoryModel = ingredineCategoryModelFromJson(jsonString);

import 'dart:convert';

IngredineCategoryModel ingredineCategoryModelFromJson(String str) => IngredineCategoryModel.fromJson(json.decode(str));

String ingredineCategoryModelToJson(IngredineCategoryModel data) => json.encode(data.toJson());

class IngredineCategoryModel {
  IngredineCategoryModel({
    required this.data,
  });

  List<Datum> data;

  factory IngredineCategoryModel.fromJson(Map<String, dynamic> json) => IngredineCategoryModel(
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
    this.status,
  });

  int id;
  String name;
  dynamic status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    status: json["status"]==null?"":json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
  };
}
