// To parse this JSON data, do
//
//     final singleMealAddons = singleMealAddonsFromJson(jsonString);

import 'dart:convert';

SingleMealAddons singleMealAddonsFromJson(String str) => SingleMealAddons.fromJson(json.decode(str));

String singleMealAddonsToJson(SingleMealAddons data) => json.encode(data.toJson());

class SingleMealAddons {
  SingleMealAddons({
    this.data,
  });

  Data? data;

  factory SingleMealAddons.fromJson(Map<String, dynamic> json) => SingleMealAddons(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.price,
    this.image,
    this.details,
    this.status,
  });

  int? id;
  String? name;
  String? price;
  String? image;
  String? details;
  int? status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
