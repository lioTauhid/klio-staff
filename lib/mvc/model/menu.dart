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
    this.image,
    this.price,
    this.taxVat,
    this.quantity,
    this.addons,
    this.variants,
    this.variant,
    this.description,
  });

  int? id;
  String? name;
  String? image;
  String? price;
  String? taxVat;
  int? quantity;
  AddonsClass? addons;
  Variants? variants;
  String? variant;
  String? description;

  factory MenuData.fromJson(Map<String, dynamic> json) => MenuData(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    taxVat: json["tax_vat"],
    quantity: json["quantity"],
    addons: AddonsClass.fromJson(json["addons"]),
    variants: Variants.fromJson(json["variants"]),
    variant: json["variant"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "tax_vat": taxVat,
    "quantity": quantity,
    "addons": addons!.toJson(),
    "variants": variants!.toJson(),
    "variant": variant,
    "description": description,
  };
}

class AddonsClass {
  AddonsClass({
    this.data,
  });

  List<AddonsDatum>? data;

  factory AddonsClass.fromJson(Map<String, dynamic> json) => AddonsClass(
    data: List<AddonsDatum>.from(json["data"].map((x) => AddonsDatum.fromJson(x))),
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
    data: List<VariantsDatum>.from(json["data"].map((x) => VariantsDatum.fromJson(x))),
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
