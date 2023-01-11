// To parse this JSON data, do
//
//     final foodMenuAllergy = foodMenuAllergyFromJson(jsonString);

import 'dart:convert';

FoodMenuAllergy foodMenuAllergyFromJson(String str) => FoodMenuAllergy.fromJson(json.decode(str));

String foodMenuAllergyToJson(FoodMenuAllergy data) => json.encode(data.toJson());

class FoodMenuAllergy {
  FoodMenuAllergy({
     this.data,
  });

  List<Allergy>? data;

  factory FoodMenuAllergy.fromJson(Map<String, dynamic> json) => FoodMenuAllergy(
    data: List<Allergy>.from(json["data"].map((x) => Allergy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Allergy {
  Allergy({
     this.id,
     this.name,
     this.image,
     this.status,
  });

  int ?id;
  String? name;
  String? image;
  int? status;

  factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
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
