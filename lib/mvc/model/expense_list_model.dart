// To parse this JSON data, do
//
//     final expenseDataList = expenseDataListFromJson(jsonString);

import 'dart:convert';

ExpenseDataList expenseDataListFromJson(String str) => ExpenseDataList.fromJson(json.decode(str));

String expenseDataListToJson(ExpenseDataList data) => json.encode(data.toJson());

class ExpenseDataList {
  ExpenseDataList({
    required this.data,
  });

  List<Datum> data;

  factory ExpenseDataList.fromJson(Map<String, dynamic> json) => ExpenseDataList(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.person,
    required this.category,
    required this.date,
    required this.amount,
    required this.note,
    this.status,
  });

  int id;
  Category person;
  Category category;
  DateTime date;
  String amount;
  String note;
  dynamic status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    person: Category.fromJson(json["person"]),
    category: Category.fromJson(json["category"]),
    date: DateTime.parse(json["date"]),
    amount: json["amount"],
    note: json["note"],
    status: json["status"]==null?"":json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "person": person.toJson(),
    "category": category.toJson(),
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "amount": amount,
    "note": note,
    "status": status,
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
