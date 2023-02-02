// To parse this JSON data, do
//
//     final dashData = dashDataFromJson(jsonString);

import 'dart:convert';

DashData dashDataFromJson(String str) => DashData.fromJson(json.decode(str));

String dashDataToJson(DashData data) => json.encode(data.toJson());

class DashData {
  DashData({
    this.data,
  });

  Data? data;

  factory DashData.fromJson(Map<String, dynamic> json) => DashData(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.pendingOrders,
    this.successOrders,
    this.cancelOrders,
    this.dailyOrders,
    this.weeklyOrders,
    this.monthlyOrders,
    this.yearlyOrders,
    this.totalOrders,
    this.dailySales,
    this.weeklySales,
    this.monthlySales,
    this.yearlySales,
    this.totalSales,
    this.orderHistory,
    this.onlineOrders,
    this.topItems,
  });

  int ?pendingOrders;
  int? successOrders;
  int ?cancelOrders;
  int ?dailyOrders;
  int? weeklyOrders;
  int? monthlyOrders;
  int? yearlyOrders;
  int ?totalOrders;
  dynamic dailySales;
  dynamic weeklySales;
  String ?monthlySales;
  String ?yearlySales;
  String? totalSales;
  OnlineOrders? orderHistory;
  OnlineOrders ?onlineOrders;
  OnlineOrders ?topItems;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pendingOrders: json["pending_orders"],
    successOrders: json["success_orders"],
    cancelOrders: json["cancel_orders"],
    dailyOrders: json["daily_orders"],
    weeklyOrders: json["weekly_orders"],
    monthlyOrders: json["monthly_orders"],
    yearlyOrders: json["yearly_orders"],
    totalOrders: json["total_orders"],
    dailySales: json["daily_sales"],
    weeklySales: json["weekly_sales"],
    monthlySales: json["monthly_sales"],
    yearlySales: json["yearly_sales"],
    totalSales: json["total_sales"],
    orderHistory: OnlineOrders.fromJson(json["order_history"]),
    onlineOrders: OnlineOrders.fromJson(json["online_orders"]),
    topItems: OnlineOrders.fromJson(json["top_items"]),
  );

  Map<String, dynamic> toJson() => {
    "pending_orders": pendingOrders,
    "success_orders": successOrders,
    "cancel_orders": cancelOrders,
    "daily_orders": dailyOrders,
    "weekly_orders": weeklyOrders,
    "monthly_orders": monthlyOrders,
    "yearly_orders": yearlyOrders,
    "total_orders": totalOrders,
    "daily_sales": dailySales,
    "weekly_sales": weeklySales,
    "monthly_sales": monthlySales,
    "yearly_sales": yearlySales,
    "total_sales": totalSales,
    "order_history": orderHistory!.toJson(),
    "online_orders": onlineOrders!.toJson(),
    "top_items": topItems!.toJson(),
  };
}

class OnlineOrders {
  OnlineOrders({
    this.data,
  });

  List<Datum>? data;

  factory OnlineOrders.fromJson(Map<String, dynamic> json) => OnlineOrders(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.date,
    this.customerName,
    this.invoice,
    this.grandTotal,
    this.status,
    this.name,
    this.price,
    this.totalSoldPrice,
    this.totalOrdered,
  });

  String? date;
  String? customerName;
  String? invoice;
  String? grandTotal;
  String? status;
  String? name;
  String? price;
  String? totalSoldPrice;
  String? totalOrdered;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    date: json["date"] == null ? null : json["date"],
    customerName: json["customer_name"] == null ? null : json["customer_name"],
    invoice: json["invoice"] == null ? null : json["invoice"],
    grandTotal: json["grand_total"] == null ? null : json["grand_total"],
    status: json["status"] == null ? null : json["status"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"],
    totalSoldPrice: json["total_sold_price"] == null ? null : json["total_sold_price"],
    totalOrdered: json["total_ordered"] == null ? null : json["total_ordered"],
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date,
    "customer_name": customerName == null ? null : customerName,
    "invoice": invoice == null ? null : invoice,
    "grand_total": grandTotal == null ? null : grandTotal,
    "status": status == null ? null : status,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "total_sold_price": totalSoldPrice == null ? null : totalSoldPrice,
    "total_ordered": totalOrdered == null ? null : totalOrdered,
  };
}
