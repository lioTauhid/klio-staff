// To parse this JSON data, do
//
//     final foodMenuAddons = foodMenuAddonsFromJson(jsonString);

import 'dart:convert';

FoodMenuAddons foodMenuAddonsFromJson(String str) => FoodMenuAddons.fromJson(json.decode(str));

String foodMenuAddonsToJson(FoodMenuAddons data) => json.encode(data.toJson());

class FoodMenuAddons {
  FoodMenuAddons({
     this.data,
  });

  List<MenuAddon> ?data;

  factory FoodMenuAddons.fromJson(Map<String, dynamic> json) => FoodMenuAddons(
    data: List<MenuAddon>.from(json["data"].map((x) => MenuAddon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class MenuAddon {
  MenuAddon({
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
  String ?image;
  String ?details;
  int? status;

  factory MenuAddon.fromJson(Map<String, dynamic> json) => MenuAddon(
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
