// To parse this JSON data, do
//
//     final purchaseListModel = purchaseListModelFromJson(jsonString);

import 'dart:convert';

PurchaseListModel purchaseListModelFromJson(String str) => PurchaseListModel.fromJson(json.decode(str));

String purchaseListModelToJson(PurchaseListModel data) => json.encode(data.toJson());

class PurchaseListModel {
  PurchaseListModel({
    required this.data,
  });

  List<Datum> data;

  factory PurchaseListModel.fromJson(Map<String, dynamic> json) => PurchaseListModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.supplierId,
    this.bankId,
    required this.referenceNo,
    required this.totalAmount,
    required this.shippingCharge,
    required this.discountAmount,
    required this.paidAmount,
    required this.status,
    required this.date,
    required this.paymentType,
    this.details,
    required this.supplier,
    required this.bank,
  });

  int id;
  int supplierId;
  dynamic bankId;
  String referenceNo;
  String totalAmount;
  String shippingCharge;
  String discountAmount;
  String paidAmount;
  int status;
  DateTime date;
  String paymentType;
  dynamic details;
  Bank supplier;
  Bank bank;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    supplierId: json["supplier_id"],
    bankId: json["bank_id"]==null?"":json["bank_id"],
    referenceNo: json["reference_no"],
    totalAmount: json["total_amount"],
    shippingCharge: json["shipping_charge"],
    discountAmount: json["discount_amount"],
    paidAmount: json["paid_amount"],
    status: json["status"],
    date: DateTime.parse(json["date"]),
    paymentType: json["payment_type"],
    details: json["details"]==null?"":json["details"],
    supplier: Bank.fromJson(json["supplier"]),
    bank: Bank.fromJson(json["bank"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "supplier_id": supplierId,
    "bank_id": bankId,
    "reference_no": referenceNo,
    "total_amount": totalAmount,
    "shipping_charge": shippingCharge,
    "discount_amount": discountAmount,
    "paid_amount": paidAmount,
    "status": status,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "payment_type": paymentType,
    "details": details,
    "supplier": supplier.toJson(),
    "bank": bank.toJson(),
  };
}

class Bank {
  Bank({
     this.id,
    required this.name,
  });

  dynamic id;
  String name;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
    id: json["id"] == null ? " " : json["id"],
    name: json["name"] == null ? "  " : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? " " : id,
    "name": name == null ? "  " : name,
  };
}
