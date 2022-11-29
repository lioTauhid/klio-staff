// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    this.data,
  });

  List<OrderDatum>? data;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
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
    number: json["table_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "table_number": number,
  };
}
