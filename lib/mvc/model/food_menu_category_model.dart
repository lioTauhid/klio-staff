// To parse this JSON data, do
//
//     final foodMenuCategory = foodMenuCategoryFromJson(jsonString);

import 'dart:convert';

FoodMenuCategory foodMenuCategoryFromJson(String str) => FoodMenuCategory.fromJson(json.decode(str));

String foodMenuCategoryToJson(FoodMenuCategory data) => json.encode(data.toJson());

class FoodMenuCategory {
  FoodMenuCategory({
    required this.data,
  });

  List<Datum> data;

  factory FoodMenuCategory.fromJson(Map<String, dynamic> json) => FoodMenuCategory(
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
    required this.image,
    required this.status,
    required this.isDrinks,
  });

  int id;
  String name;
  String image;
  int status;
  int isDrinks;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
    isDrinks: json["is_drinks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "status": status,
    "is_drinks": isDrinks,
  };
}
