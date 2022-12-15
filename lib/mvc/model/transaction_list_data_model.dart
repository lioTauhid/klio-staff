// To parse this JSON data, do
//
//     final transactionListModel = transactionListModelFromJson(jsonString);

import 'dart:convert';

TransactionListModel transactionListModelFromJson(String str) => TransactionListModel.fromJson(json.decode(str));

String transactionListModelToJson(TransactionListModel data) => json.encode(data.toJson());

class TransactionListModel {
  TransactionListModel({
    required this.data,
  });

  List<Datum> data;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) => TransactionListModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    required this.withdrawDepositeId,
    required this.amount,
    required this.type,
    required this.decsription,
    required this.date,
    required this.bank,
  });

  dynamic id;
  String withdrawDepositeId;
  String amount;
  String type;
  String decsription;
  String date;
  Bank bank;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]==null?"":json["id"],
    withdrawDepositeId: json["withdraw_deposite_id"],
    amount: json["amount"],
    type: json["type"],
    decsription: json["decsription"]==null?"":json["decsription"],
    date: json["date"],
    bank: Bank.fromJson(json["bank"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "withdraw_deposite_id": withdrawDepositeId,
    "amount": amount,
    "type": type,
    "decsription": decsription,
    "date": date,
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
    id: json["id"]==null?"":json["id"],
    name: json["name"] == null ? "" : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name == null ? "" : name,
  };
}
