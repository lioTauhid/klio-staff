// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  Menu({
    this.data,
  });

  List<MenuDatum>? data;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    data: List<MenuDatum>.from(json["data"].map((x) => MenuDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class MenuDatum {
  MenuDatum({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.price,
    this.calorie,
    this.allergies,
  });

  int? id;
  String? name;
  String? slug;
  String? image;
  String? price;
  String? calorie;
  Allergies? allergies;

  factory MenuDatum.fromJson(Map<String, dynamic> json) => MenuDatum(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    price: json["price"],
    calorie: json["calorie"],
    allergies: Allergies.fromJson(json["allergies"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "price": price,
    "calorie": calorie,
    "allergies": allergies!.toJson(),
  };
}

class Allergies {
  Allergies({
    this.data,
  });

  List<AllergiesDatum>? data;

  factory Allergies.fromJson(Map<String, dynamic> json) => Allergies(
    data: List<AllergiesDatum>.from(json["data"].map((x) => AllergiesDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AllergiesDatum {
  AllergiesDatum({
    this.name,
    this.image,
  });

  String? name;
  String? image;

  factory AllergiesDatum.fromJson(Map<String, dynamic> json) => AllergiesDatum(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}
