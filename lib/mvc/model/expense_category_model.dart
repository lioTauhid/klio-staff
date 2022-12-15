// To parse this JSON data, do
//
//     final expenseCategoryModel = expenseCategoryModelFromJson(jsonString);

import 'dart:convert';

ExpenseCategoryModel expenseCategoryModelFromJson(String str) => ExpenseCategoryModel.fromJson(json.decode(str));

String expenseCategoryModelToJson(ExpenseCategoryModel data) => json.encode(data.toJson());

class ExpenseCategoryModel {
  ExpenseCategoryModel({
    required this.data,
  });

  List<Datum> data;

  factory ExpenseCategoryModel.fromJson(Map<String, dynamic> json) => ExpenseCategoryModel(
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
    required this.status,
  });

  int id;
  String name;
  int status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
  };
}
