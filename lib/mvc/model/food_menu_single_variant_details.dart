// To parse this JSON data, do
//
//     final singleVariantDetails = singleVariantDetailsFromJson(jsonString);

import 'dart:convert';

SingleVariantDetails singleVariantDetailsFromJson(String str) => SingleVariantDetails.fromJson(json.decode(str));

String singleVariantDetailsToJson(SingleVariantDetails data) => json.encode(data.toJson());

class SingleVariantDetails {
  SingleVariantDetails({
    this.data,
  });

  SinlgeVariantData? data;

  factory SingleVariantDetails.fromJson(Map<String, dynamic> json) => SingleVariantDetails(
    data: SinlgeVariantData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class SinlgeVariantData {
  SinlgeVariantData({
    this.id,
    this.foodId,
    this.name,
    this.price,
    this.status,
  });

  int? id;
  int? foodId;
  String? name;
  String? price;
  int? status;

  factory SinlgeVariantData.fromJson(Map<String, dynamic> json) => SinlgeVariantData(
    id: json["id"],
    foodId: json["food_id"],
    name: json["name"],
    price: json["price"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "food_id": foodId,
    "name": name,
    "price": price,
    "status": status,
  };
}
