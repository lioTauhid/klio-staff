// To parse this JSON data, do
//
//     final bankListModel = bankListModelFromJson(jsonString);

import 'dart:convert';

BankListModel bankListModelFromJson(String str) => BankListModel.fromJson(json.decode(str));

String bankListModelToJson(BankListModel data) => json.encode(data.toJson());

class BankListModel {
  BankListModel({
    required this.data,
  });

  List<Datum> data;

  factory BankListModel.fromJson(Map<String, dynamic> json) => BankListModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.accountName,
    required this.accountNumber,
    required this.branchName,
    required this.balance,
    required this.signatureImage,
  });

  int id;
  String name;
  String accountName;
  String accountNumber;
  String branchName;
  String balance;
  String signatureImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    accountName: json["account_name"],
    accountNumber: json["account_number"],
    branchName: json["branch_name"],
    balance: json["balance"],
    signatureImage: json["signature_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "account_name": accountName,
    "account_number": accountNumber,
    "branch_name": branchName,
    "balance": balance,
    "signature_image": signatureImage,
  };
}
