// To parse this JSON data, do
//
//     final foodMenuVariants = foodMenuVariantsFromJson(jsonString);

import 'dart:convert';

FoodMenuVariants foodMenuVariantsFromJson(String str) => FoodMenuVariants.fromJson(json.decode(str));

String foodMenuVariantsToJson(FoodMenuVariants data) => json.encode(data.toJson());

class FoodMenuVariants {
  FoodMenuVariants({
    required this.data,
  });

  List<Datum> data;

  factory FoodMenuVariants.fromJson(Map<String, dynamic> json) => FoodMenuVariants(
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
    required this.price,
    required this.status,
    required this.food,
  });

  int id;
  String name;
  String price;
  int status;
  Food food;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    status: json["status"],
    food: Food.fromJson(json["food"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "status": status,
    "food": food.toJson(),
  };
}

class Food {
  Food({
    required this.name,
  });

  String name;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
