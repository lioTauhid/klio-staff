// To parse this JSON data, do
//
//     final ingredinetListModel = ingredinetListModelFromJson(jsonString);

import 'dart:convert';

IngredinetListModel ingredinetListModelFromJson(String str) => IngredinetListModel.fromJson(json.decode(str));

String ingredinetListModelToJson(IngredinetListModel data) => json.encode(data.toJson());

class IngredinetListModel {
  IngredinetListModel({
     this.data,
  });

  List<Ingrediant>? data;

  factory IngredinetListModel.fromJson(Map<String, dynamic> json) => IngredinetListModel(
    data: List<Ingrediant>.from(json["data"].map((x) => Ingrediant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Ingrediant {
  Ingrediant({
    this.id,
    this.categoryName,
    this.unitName,
    this.name,
    this.purchasePrice,
    this.alertQty,
    this.code,
  });

  dynamic id;
  dynamic categoryName;
  dynamic unitName;
  dynamic name;
  dynamic purchasePrice;
  dynamic alertQty;
  dynamic code;

  factory Ingrediant.fromJson(Map<String, dynamic> json) => Ingrediant(
    id: json["id"]==null?"":json["id"],
    categoryName: json["category_name"]==null?"":json["category_name"],
    unitName: json["unit_name"]==null?"":json["unit_name"],
    name: json["name"]==null?"":json["name"],
    purchasePrice: json["purchase_price"]==null?"":json["purchase_price"],
    alertQty: json["alert_qty"]==null?"":json["alert_qty"],
    code: json["code"]==null?"":json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "unit_name": unitName,
    "name": name,
    "purchase_price": purchasePrice,
    "alert_qty": alertQty,
    "code": code,
  };
}
