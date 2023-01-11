// To parse this JSON data, do
//
//     final foodMenuCategory = foodMenuCategoryFromJson(jsonString);

import 'dart:convert';

FoodMenuCategory foodMenuCategoryFromJson(String str) => FoodMenuCategory.fromJson(json.decode(str));

String foodMenuCategoryToJson(FoodMenuCategory data) => json.encode(data.toJson());

class FoodMenuCategory {
  FoodMenuCategory({
     this.data,
  });

  List<MenuCategory>? data;

  factory FoodMenuCategory.fromJson(Map<String, dynamic> json) => FoodMenuCategory(
    data: List<MenuCategory>.from(json["data"].map((x) => MenuCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class MenuCategory {
  MenuCategory({
     this.id,
     this.name,
     this.image,
     this.status,
     this.isDrinks,
  });

  int ?id;
  String ?name;
  String ?image;
  int ?status;
  int ?isDrinks;

  factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
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
