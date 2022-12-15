// To parse this JSON data, do
//
//     final foodMenuAddons = foodMenuAddonsFromJson(jsonString);

import 'dart:convert';

FoodMenuAddons foodMenuAddonsFromJson(String str) => FoodMenuAddons.fromJson(json.decode(str));

String foodMenuAddonsToJson(FoodMenuAddons data) => json.encode(data.toJson());

class FoodMenuAddons {
  FoodMenuAddons({
    required this.data,
  });

  List<Datum> data;

  factory FoodMenuAddons.fromJson(Map<String, dynamic> json) => FoodMenuAddons(
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
    required this.image,
    required this.details,
    required this.status,
  });

  int id;
  String name;
  String price;
  String image;
  String details;
  int status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    image: json["image"],
    details: json["details"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "image": image,
    "details": details,
    "status": status,
  };
}
