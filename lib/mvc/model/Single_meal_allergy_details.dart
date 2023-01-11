// To parse this JSON data, do
//
//     final singleDisplayAllergyDetails = singleDisplayAllergyDetailsFromJson(jsonString);

import 'dart:convert';

SingleDisplayAllergyDetails singleDisplayAllergyDetailsFromJson(String str) => SingleDisplayAllergyDetails.fromJson(json.decode(str));

String singleDisplayAllergyDetailsToJson(SingleDisplayAllergyDetails data) => json.encode(data.toJson());

class SingleDisplayAllergyDetails {
  SingleDisplayAllergyDetails({
    this.data,
  });

  Data? data;

  factory SingleDisplayAllergyDetails.fromJson(Map<String, dynamic> json) => SingleDisplayAllergyDetails(
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
  });

  int? id;
  String? name;
  String? image;
  int? status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
