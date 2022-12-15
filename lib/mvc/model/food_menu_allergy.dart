// To parse this JSON data, do
//
//     final foodMenuAllergy = foodMenuAllergyFromJson(jsonString);

import 'dart:convert';

FoodMenuAllergy foodMenuAllergyFromJson(String str) => FoodMenuAllergy.fromJson(json.decode(str));

String foodMenuAllergyToJson(FoodMenuAllergy data) => json.encode(data.toJson());

class FoodMenuAllergy {
  FoodMenuAllergy({
    required this.data,
  });

  List<Datum> data;

  factory FoodMenuAllergy.fromJson(Map<String, dynamic> json) => FoodMenuAllergy(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
  });

  int id;
  String name;
  String image;
  int status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
