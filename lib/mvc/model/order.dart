// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.data,
  });

  List<OrderDatum>? data;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    data: List<OrderDatum>.from(json["data"].map((x) => OrderDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OrderDatum {
  OrderDatum({
    this.id,
    this.type,
    this.invoice,
    this.tables,
  });

  int? id;
  String? type;
  String? invoice;
  Tables? tables;

  factory OrderDatum.fromJson(Map<String, dynamic> json) => OrderDatum(
    id: json["id"],
    type: json["type"],
    invoice: json["invoice"] == null ? null : json["invoice"],
    tables: Tables.fromJson(json["tables"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "invoice": invoice == null ? null : invoice,
    "tables": tables!.toJson(),
  };
}

class Tables {
  Tables({
    this.data,
  });

  List<TablesDatum>? data;

  factory Tables.fromJson(Map<String, dynamic> json) => Tables(
    data: List<TablesDatum>.from(json["data"].map((x) => TablesDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class TablesDatum {
  TablesDatum({
    this.id,
    this.number,
  });

  int? id;
  String? number;

  factory TablesDatum.fromJson(Map<String, dynamic> json) => TablesDatum(
    id: json["id"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
  };
}
