// To parse this JSON data, do
//
//     final ingredineUnitModel = ingredineUnitModelFromJson(jsonString);

import 'dart:convert';

IngredineUnitModel ingredineUnitModelFromJson(String str) => IngredineUnitModel.fromJson(json.decode(str));

String ingredineUnitModelToJson(IngredineUnitModel data) => json.encode(data.toJson());

class IngredineUnitModel {
  IngredineUnitModel({
    required this.data,
  });

  List<Datum> data;

  factory IngredineUnitModel.fromJson(Map<String, dynamic> json) => IngredineUnitModel(
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
    required this.description,
    this.status,
  });

  int id;
  String name;
  String description;
  dynamic status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    status: json["status"]==null?"":json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "status": status,
  };
}
