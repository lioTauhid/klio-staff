// To parse this JSON data, do
//
//     final fooodMenueDetailsSingleItem = fooodMenueDetailsSingleItemFromJson(jsonString);

import 'dart:convert';

import 'package:klio_staff/mvc/model/food_menu_addons.dart';

FooodMenueDetailsSingleItem fooodMenueDetailsSingleItemFromJson(String str) => FooodMenueDetailsSingleItem.fromJson(json.decode(str));

String fooodMenueDetailsSingleItemToJson(FooodMenueDetailsSingleItem data) => json.encode(data.toJson());

class FooodMenueDetailsSingleItem {
  FooodMenueDetailsSingleItem({
    this.data,
  });

  SingleMenuDetailsData? data;

  factory FooodMenueDetailsSingleItem.fromJson(Map<String, dynamic> json) => FooodMenueDetailsSingleItem(
    data: SingleMenuDetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class SingleMenuDetailsData {
  SingleMenuDetailsData({
    this.id,
    this.name,
    this.image,
    this.price,
    this.calories,
    this.processingTime,
    this.taxVat,
    this.description,
    this.addons,
    this.variants,
    this.variant,
  });

  int ? id;
  String ? name;
  String ? image;
  String ? price;
  String ? calories;
  String ? processingTime;
  String? taxVat;
  String? description;
  Addons? addons;
  Addons? variants;
  String? variant;

  factory SingleMenuDetailsData.fromJson(Map<String, dynamic> json) => SingleMenuDetailsData(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    calories: json["calorie"],
    processingTime: json["processing_time"],
    taxVat: json["tax_vat"],
    description: json["description"],
    addons: Addons.fromJson(json["addons"]),
    variants: Addons.fromJson(json["variants"]),
    variant: json["variant"]==null?" ": json["variant"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "tax_vat": taxVat,
    "description": description,
    "addons": addons!.toJson(),
    "variants": variants!.toJson(),
    "variant": variant,
  };
}

class Addons {
  Addons({
    this.data,
  });

  List<MenuAddon>? data;

  factory Addons.fromJson(Map<String, dynamic> json) => Addons(
    data: List<MenuAddon>.from(json["data"].map((x) => MenuAddon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

//
// class Variant {
//   Variant({
//     this.data,
//   });
//
//   List<MenuAddon>? data;
//
//   factory Variant.fromJson(Map<String, dynamic> json) => Variant(
//     data: List<MenuAddon>.from(json["data"].map((x) => MenuAddon.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//   };
// }