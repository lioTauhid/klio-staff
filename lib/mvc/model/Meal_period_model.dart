// To parse this JSON data, do
//
//     final mealPeriod = mealPeriodFromJson(jsonString);

import 'dart:convert';

MealPeriod mealPeriodFromJson(String str) => MealPeriod.fromJson(json.decode(str));

String mealPeriodToJson(MealPeriod data) => json.encode(data.toJson());

class MealPeriod {
  MealPeriod({
     this.data,
  });

  List<Meal>? data;

  factory MealPeriod.fromJson(Map<String, dynamic> json) => MealPeriod(
    data: List<Meal>.from(json["data"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Meal {
  Meal({
     this.id,
     this.name,
     this.image,
     this.status,
  });

  int? id;
  String ?name;
  String ?image;
  int? status;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
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
