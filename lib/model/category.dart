// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.data,
  });

  List<Datum>? data;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.status,
    this.isDrinks,
  });

  int? id;
  String? name;
  String? slug;
  String? image;
  int? status;
  int? isDrinks;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    status: json["status"],
    isDrinks: json["is_drinks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "status": status,
    "is_drinks": isDrinks,
  };
}
