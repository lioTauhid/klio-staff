// To parse this JSON data, do
//
//     final kitchenOrder = kitchenOrderFromJson(jsonString);

import 'dart:convert';

KitchenOrder kitchenOrderFromJson(String str) => KitchenOrder.fromJson(json.decode(str));

String kitchenOrderToJson(KitchenOrder data) => json.encode(data.toJson());

class KitchenOrder {
  KitchenOrder({
    this.data,
  });

  List<KitchenOrderDatum> ?data;

  factory KitchenOrder.fromJson(Map<String, dynamic> json) => KitchenOrder(
    data: List<KitchenOrderDatum>.from(json["data"].map((x) => KitchenOrderDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class KitchenOrderDatum {
  KitchenOrderDatum({
    this.id,
    this.invoice,
    this.availableTime,
    this.status,
    this.tables,
    this.orderDetails,
  });

  int? id;
  String ?invoice;
  String ?availableTime;
  String ?status;
  List<int>? tables;
  OrderDetails ?orderDetails;

  factory KitchenOrderDatum.fromJson(Map<String, dynamic> json) => KitchenOrderDatum(
    id: json["id"],
    invoice: json["invoice"],
    availableTime: json["available_time"],
    status: json["status"],
    tables: List<int>.from(json["tables"].map((x) => x)),
    orderDetails: OrderDetails.fromJson(json["orderDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "invoice": invoice,
    "available_time": availableTime,
    "status": status,
    "tables": List<dynamic>.from(tables!.map((x) => x)),
    "orderDetails": orderDetails!.toJson(),
  };
}

class OrderDetails {
  OrderDetails({
    this.data,
  });

  List<OrderDetailsDatum> ?data;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    data: List<OrderDetailsDatum>.from(json["data"].map((x) => OrderDetailsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OrderDetailsDatum {
  OrderDetailsDatum({
    this.id,
    this.status,
    this.foodName,
    this.quantity,
    this.selected = false,
    this.variantName,
    this.addons,
  });

  int ?id;
  String ?status;
  String ?foodName;
  int ?quantity;
  bool ?selected;
  String ?variantName;
  Addons? addons;

  factory OrderDetailsDatum.fromJson(Map<String, dynamic> json) => OrderDetailsDatum(
    id: json["id"],
    status: json["status"],
    foodName: json["food_name"],
    quantity: json["quantity"],
    variantName: json["variant_name"],
    addons: Addons.fromJson(json["addons"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "food_name": foodName,
    "quantity": quantity,
    "selected": selected,
    "variant_name": variantName,
    "addons": addons!.toJson(),
  };
}

class Addons {
  Addons({
    this.data,
  });

  List<AddonsDatum> ?data;

  factory Addons.fromJson(Map<String, dynamic> json) => Addons(
    data: List<AddonsDatum>.from(json["data"].map((x) => AddonsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AddonsDatum {
  AddonsDatum({
    this.id,
    this.name,
    this.quantity,
  });

  int? id;
  String? name;
  int? quantity;

  factory AddonsDatum.fromJson(Map<String, dynamic> json) => AddonsDatum(
    id: json["id"],
    name: json["name"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "quantity": quantity,
  };
}
