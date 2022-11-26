// To parse this JSON data, do
//
//     final onlineOrder = onlineOrderFromJson(jsonString);

import 'dart:convert';

OnlineOrder onlineOrderFromJson(String str) => OnlineOrder.fromJson(json.decode(str));

String onlineOrderToJson(OnlineOrder data) => json.encode(data.toJson());

class OnlineOrder {
  OnlineOrder({
    this.data,
  });

  List<Datum> ?data;

  factory OnlineOrder.fromJson(Map<String, dynamic> json) => OnlineOrder(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.invoice,
    this.grandTotal,
    this.user,
  });

  int? id;
  String? invoice;
  String ?grandTotal;
  UserData ?user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    invoice: json["invoice"],
    grandTotal: json["grand_total"],
    user: UserData.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "invoice": invoice,
    "grand_total": grandTotal,
    "user": user!.toJson(),
  };
}

class UserData {
  UserData({
    this.name,
    this.image,
  });

  String? name;
  dynamic image;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}
