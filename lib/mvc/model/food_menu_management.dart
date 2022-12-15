// To parse this JSON data, do
//
//     final foodMenuManagement = foodMenuManagementFromJson(jsonString);

import 'dart:convert';

FoodMenuManagement foodMenuManagementFromJson(String str) => FoodMenuManagement.fromJson(json.decode(str));

String foodMenuManagementToJson(FoodMenuManagement data) => json.encode(data.toJson());

class FoodMenuManagement {
  FoodMenuManagement({
    required this.data,
  });

  List<FoodMenuManagementDatum> data;

  factory FoodMenuManagement.fromJson(Map<String, dynamic> json) => FoodMenuManagement(
    data: List<FoodMenuManagementDatum>.from(json["data"].map((x) => FoodMenuManagementDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class FoodMenuManagementDatum {
  FoodMenuManagementDatum({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.price,
    required this.taxVat,
    required this.calorie,
    required this.description,
    required this.allergies,
    required this.addons,
    required this.variants,
  });

  int id;
  String name;
  String slug;
  String image;
  String price;
  String taxVat;
  String calorie;
  String description;
  Allergies allergies;
  Addons addons;
  Addons variants;

  factory FoodMenuManagementDatum.fromJson(Map<String, dynamic> json) => FoodMenuManagementDatum(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    price: json["price"],
    taxVat: json["tax_vat"],
    calorie: json["calorie"],
    description: json["description"],
    allergies: Allergies.fromJson(json["allergies"]),
    addons: Addons.fromJson(json["addons"]),
    variants: Addons.fromJson(json["variants"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "price": price,
    "tax_vat": taxVat,
    "calorie": calorie,
    "description": description,
    "allergies": allergies.toJson(),
    "addons": addons.toJson(),
    "variants": variants.toJson(),
  };
}

class Addons {
  Addons({
    required this.data,
  });

  List<AddonsDatum> data;

  factory Addons.fromJson(Map<String, dynamic> json) => Addons(
    data: List<AddonsDatum>.from(json["data"].map((x) => AddonsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AddonsDatum {
  AddonsDatum({
    required this.id,
    required this.name,
    required this.price,
  });

  int id;
  String name;
  String price;

  factory AddonsDatum.fromJson(Map<String, dynamic> json) => AddonsDatum(
    id: json["id"],
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
  };
}

class Allergies {
  Allergies({
    required this.data,
  });

  List<AllergiesDatum> data;

  factory Allergies.fromJson(Map<String, dynamic> json) => Allergies(
    data: List<AllergiesDatum>.from(json["data"].map((x) => AllergiesDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AllergiesDatum {
  AllergiesDatum({
    required this.name,
    required this.image,
  });

  String name;
  String image;

  factory AllergiesDatum.fromJson(Map<String, dynamic> json) => AllergiesDatum(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}
