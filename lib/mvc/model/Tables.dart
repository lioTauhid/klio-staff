// To parse this JSON data, do
//
//     final tableList = tableListFromJson(jsonString);

import 'dart:convert';

TableList tableListFromJson(String str) => TableList.fromJson(json.decode(str));

String tableListToJson(TableList data) => json.encode(data.toJson());

class TableList {
  TableList({
    this.data,
  });

  List<TableListDatum>? data;

  factory TableList.fromJson(Map<String, dynamic> json) => TableList(
    data: List<TableListDatum>.from(json["data"].map((x) => TableListDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class TableListDatum {
  TableListDatum({
    this.id,
    this.name,
    this.number,
    this.capacity,
    this.available,
    this.image,
    this.orders,
    this.message,
    this.person,
  });

  int? id;
  String? name;
  String ?number;
  int ?capacity;
  int? available;
  String? image;
  TableOrders ?orders;
  String? message;
  int? person;

  factory TableListDatum.fromJson(Map<String, dynamic> json) => TableListDatum(
    id: json["id"],
    name: json["name"],
    number: json["number"],
    capacity: json["capacity"],
    available: json["available"],
    image: json["image"],
    orders: TableOrders.fromJson(json["orders"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "number": number,
    "capacity": capacity,
    "available": available,
    "image": image,
    "orders": orders!.toJson(),
    "message": message,
    "person": person,
  };
}

class TableOrders {
  TableOrders({
    this.data,
  });

  List<OrdersDatum> ?data;

  factory TableOrders.fromJson(Map<String, dynamic> json) => TableOrders(
    data: List<OrdersDatum>.from(json["data"].map((x) => OrdersDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OrdersDatum {
  OrdersDatum({
    this.id,
    this.totalPerson,
    this.invoice,
    this.availableTime,
    this.time,
  });

  int? id;
  int ?totalPerson;
  String ?invoice;
  String ?availableTime;
  String ?time;

  factory OrdersDatum.fromJson(Map<String, dynamic> json) => OrdersDatum(
    id: json["id"],
    totalPerson: json["total_person"],
    invoice: json["invoice"],
    availableTime: json["available_time"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "total_person": totalPerson,
    "invoice": invoice,
    "available_time": availableTime,
    "time": time,
  };
}
