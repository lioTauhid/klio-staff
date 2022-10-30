// To parse this JSON data, do
//
//     final addons = addonsFromJson(jsonString);

import 'dart:convert';

Addons addonsFromJson(String str) => Addons.fromJson(json.decode(str));

String addonsToJson(Addons data) => json.encode(data.toJson());

class Addons {
  Addons({
    this.data,
  });

  AddonsData? data;

  factory Addons.fromJson(Map<String, dynamic> json) => Addons(
    data: AddonsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class AddonsData {
  AddonsData({
    this.id,
    this.name,
    this.image,
    this.price,
    this.taxVat,
    this.qty,
    this.addons,
    this.variants,
    this.variant,
  });

  int? id;
  String? name;
  String? image;
  String? price;
  String? taxVat;
  int? qty;
  AddonsClass? addons;
  Variants? variants;
  String? variant;

  factory AddonsData.fromJson(Map<String, dynamic> json) => AddonsData(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    taxVat: json["tax_vat"],
    qty: json["qty"],
    addons: AddonsClass.fromJson(json["addons"]),
    variants: Variants.fromJson(json["variants"]),
    variant: json["variant"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "tax_vat": taxVat,
    "qty": qty,
    "addons": addons!.toJson(),
    "variants": variants!.toJson(),
    "variant": variant,
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
    this.name,
    this.price,
    this.qty,
    this.isChecked,
  });

  String? name;
  String? price;
  int? qty;
  bool? isChecked;

  factory AddonsDatum.fromJson(Map<String, dynamic> json) => AddonsDatum(
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
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
