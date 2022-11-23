// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

import 'menu.dart';

Menus menuFromJson(String str) => Menus.fromJson(json.decode(str));

String menuToJson(Menus data) => json.encode(data.toJson());

class Menus {
  Menus({
    this.data,
  });

  List<MenuData>? data;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    data: List<MenuData>.from(json["data"].map((x) => MenuData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

// class MenuDatum {
//   MenuDatum({
//     this.id,
//     this.name,
//     this.slug,
//     this.image,
//     this.price,
//     this.calorie,
//     this.allergies,
//   });
//
//   int? id;
//   String? name;
//   String? slug;
//   String? image;
//   String? price;
//   String? calorie;
//   Allergies? allergies;
//
//   factory MenuDatum.fromJson(Map<String, dynamic> json) => MenuDatum(
//     id: json["id"],
//     name: json["name"],
//     slug: json["slug"],
//     image: json["image"],
//     price: json["price"],
//     calorie: json["calorie"],
//     allergies: Allergies.fromJson(json["allergies"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "slug": slug,
//     "image": image,
//     "price": price,
//     "calorie": calorie,
//     "allergies": allergies!.toJson(),
//   };
// }

