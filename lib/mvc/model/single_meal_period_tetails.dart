// To parse this JSON data, do
//
//     final singleMealPeriodDetails = singleMealPeriodDetailsFromJson(jsonString);

import 'dart:convert';

SingleMealPeriodDetails singleMealPeriodDetailsFromJson(String str) => SingleMealPeriodDetails.fromJson(json.decode(str));

String singleMealPeriodDetailsToJson(SingleMealPeriodDetails data) => json.encode(data.toJson());

class SingleMealPeriodDetails {
  SingleMealPeriodDetails({
    this.data,
  });

  SingleMealPeriod? data;

  factory SingleMealPeriodDetails.fromJson(Map<String, dynamic> json) => SingleMealPeriodDetails(
    data: SingleMealPeriod.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class SingleMealPeriod {
  SingleMealPeriod({
    this.id,
    this.name,
    this.image,
    this.status,
  });

  int? id;
  String? name;
  String? image;
  int? status;

  factory SingleMealPeriod.fromJson(Map<String, dynamic> json) => SingleMealPeriod(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "status": status,
  };
}
