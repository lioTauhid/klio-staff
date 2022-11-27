// To parse this JSON data, do
//
//     final addons = addonsFromJson(jsonString);

import 'dart:convert';

Menu addonsFromJson(String str) => Menu.fromJson(json.decode(str));

String addonsToJson(Menu data) => json.encode(data.toJson());

class Menu {
  Menu({
    this.data,
  });

  MenuData? data;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        data: MenuData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class MenuData {
  MenuData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.price,
    this.calorie,
    this.taxVat,
    this.quantity,
    this.addons,
    this.variants,
    this.variant,
    this.description,
    this.allergies,
    this.categories,
  });

  int? id;
  String? name;
  String? image;
  String? slug;
  String? price;
  String? calorie;
  String? taxVat;
  int? quantity;
  AddonsClass? addons;
  Variants? variants;
  String? variant;
  String? description;
  Allergies? allergies;
  List<int>? categories;

  factory MenuData.fromJson(Map<String, dynamic> json) => MenuData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        price: json["price"],
        calorie: json["calorie"],
        taxVat: json["tax_vat"],
        quantity: json["quantity"],
        addons: AddonsClass.fromJson(json["addons"]),
        variants: Variants.fromJson(json["variants"]),
        variant: json["variant"],
        description: json["description"],
        allergies: Allergies.fromJson(json["allergies"]),
        categories: List<int>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "price": price,
        "calorie": calorie,
        "tax_vat": taxVat,
        "quantity": quantity,
        "addons": addons!.toJson(),
        "variants": variants!.toJson(),
        "variant": variant,
        "description": description,
        "allergies": allergies!.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
      };
}

class Allergies {
  Allergies({
    this.data,
  });

  List<AllergiesDatum>? data;

  factory Allergies.fromJson(Map<String, dynamic> json) => Allergies(
        data: List<AllergiesDatum>.from(
            json["data"].map((x) => AllergiesDatum.fromJson(x))),
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

class AddonsClass {
  AddonsClass({
    this.data,
  });

  List<AddonsDatum>? data;

  factory AddonsClass.fromJson(Map<String, dynamic> json) => AddonsClass(
        data: List<AddonsDatum>.from(
            json["data"].map((x) => AddonsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AddonsDatum {
  AddonsDatum({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.isChecked = true,
  });

  int? id;
  String? name;
  String? price;
  int? quantity;
  bool isChecked;

  factory AddonsDatum.fromJson(Map<String, dynamic> json) => AddonsDatum(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
      };
}

class Variants {
  Variants({
    this.data,
  });

  List<VariantsDatum>? data;

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
        data: List<VariantsDatum>.from(
            json["data"].map((x) => VariantsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class VariantsDatum {
  VariantsDatum({
    this.id,
    this.name,
    this.price,
  });

  int? id;
  String? name;
  String? price;

  factory VariantsDatum.fromJson(Map<String, dynamic> json) => VariantsDatum(
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
