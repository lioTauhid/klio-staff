// To parse this JSON data, do
//
//     final singleDisplayCategoryDetaiils = singleDisplayCategoryDetaiilsFromJson(jsonString);

import 'dart:convert';

SingleDisplayCategoryDetaiils singleDisplayCategoryDetaiilsFromJson(String str) => SingleDisplayCategoryDetaiils.fromJson(json.decode(str));

String singleDisplayCategoryDetaiilsToJson(SingleDisplayCategoryDetaiils data) => json.encode(data.toJson());

class SingleDisplayCategoryDetaiils {
  SingleDisplayCategoryDetaiils({
    this.data,
  });

  Data? data;

  factory SingleDisplayCategoryDetaiils.fromJson(Map<String, dynamic> json) => SingleDisplayCategoryDetaiils(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.image,
    this.status,
    this.isDrinks,
  });

  int? id;
  String ?name;
  String ?image;
  int ?status;
  int ?isDrinks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
    isDrinks: json["is_drinks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "status": status,
    "is_drinks": isDrinks,
  };
}
