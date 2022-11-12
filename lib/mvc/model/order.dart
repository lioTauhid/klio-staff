// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'menu.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.data,
  });

  Data? data;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.invoice,
    this.status,
    this.type,
    this.processingTime,
    this.orderBy,
    this.discount,
    this.rewardsAmount,
    this.serviceCharge,
    this.deliveryCharge,
    this.grandTotal,
    this.deliveryType,
    this.address,
    this.note,
    this.customer,
    this.orderDetails,
    this.tables,
  });

  int ?id;
  String ?invoice;
  String ?status;
  String ?type;
  String ?processingTime;
  String ?orderBy;
  String ?discount;
  String ?rewardsAmount;
  String ?serviceCharge;
  String ?deliveryCharge;
  String ?grandTotal;
  dynamic deliveryType;
  String ?address;
  dynamic note;
  Cus? customer;
  OrderDetails ?orderDetails;
  Tables? tables;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    invoice: json["invoice"],
    status: json["status"],
    type: json["type"],
    processingTime: json["processing_time"],
    orderBy: json["order_by"],
    discount: json["discount"],
    rewardsAmount: json["rewards_amount"],
    serviceCharge: json["service_charge"],
    deliveryCharge: json["delivery_charge"],
    grandTotal: json["grand_total"],
    deliveryType: json["delivery_type"],
    address: json["address"],
    note: json["note"],
    customer: Cus.fromJson(json["customer"]),
    orderDetails: OrderDetails.fromJson(json["order_details"]),
    tables: Tables.fromJson(json["tables"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "invoice": invoice,
    "status": status,
    "type": type,
    "processing_time": processingTime,
    "order_by": orderBy,
    "discount": discount,
    "rewards_amount": rewardsAmount,
    "service_charge": serviceCharge,
    "delivery_charge": deliveryCharge,
    "grand_total": grandTotal,
    "delivery_type": deliveryType,
    "address": address,
    "note": note,
    "customer": customer!.toJson(),
    "order_details": orderDetails!.toJson(),
    "tables": tables!.toJson(),
  };
}

class Cus {
  Cus({
    this.name,
  });

  String? name;

  factory Cus.fromJson(Map<String, dynamic> json) => Cus(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
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
    this.foodId,
    this.variantId,
    this.processingTime,
    this.status,
    this.price,
    this.quantity,
    this.vat,
    this.totalPrice,
    this.food,
    this.variant,
    this.addons,
  });

  int? id;
  int ?foodId;
  int ?variantId;
  String? processingTime;
  String ?status;
  String ?price;
  int ?quantity;
  String? vat;
  String ?totalPrice;
  Food ?food;
  VariantsDatum ?variant;
  AddonsClass ?addons;

  factory OrderDetailsDatum.fromJson(Map<String, dynamic> json) => OrderDetailsDatum(
    id: json["id"],
    foodId: json["food_id"],
    variantId: json["variant_id"],
    processingTime: json["processing_time"],
    status: json["status"],
    price: json["price"],
    quantity: json["quantity"],
    vat: json["vat"],
    totalPrice: json["total_price"],
    food: Food.fromJson(json["food"]),
    variant: VariantsDatum.fromJson(json["variant"]),
    addons: AddonsClass.fromJson(json["addons"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "food_id": foodId,
    "variant_id": variantId,
    "processing_time": processingTime,
    "status": status,
    "price": price,
    "quantity": quantity,
    "vat": vat,
    "total_price": totalPrice,
    "food": food!.toJson(),
    "variant": variant!.toJson(),
    "addons": addons!.toJson(),
  };
}

// class Variant {
//   Variant({
//     this.name,
//   });
//
//   String? name;
//
//   factory Variant.fromJson(Map<String, dynamic> json) => Variant(
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//   };
// }

// class Addons {
//   Addons({
//     this.data,
//   });
//
//   List<AddonsDatum>? data;
//
//   factory Addons.fromJson(Map<String, dynamic> json) => Addons(
//     data: List<AddonsDatum>.from(json["data"].map((x) => AddonsDatum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//   };
// }
//
// class AddonsDatum {
//   AddonsDatum({
//     this.id,
//     this.name,
//     this.quantity,
//     this.price,
//   });
//
//   int ?id;
//   String? name;
//   int ?quantity;
//   String? price;
//
//   factory AddonsDatum.fromJson(Map<String, dynamic> json) => AddonsDatum(
//     id: json["id"],
//     name: json["name"],
//     quantity: json["quantity"],
//     price: json["price"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "quantity": quantity,
//     "price": price,
//   };
// }

class Food {
  Food({
    this.name,
    this.image,
  });

  String? name;
  String ?image;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}

class Tables {
  Tables({
    this.data,
  });

  List<TablesDatum> ?data;

  factory Tables.fromJson(Map<String, dynamic> json) => Tables(
    data: List<TablesDatum>.from(json["data"].map((x) => TablesDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class TablesDatum {
  TablesDatum({
    this.tableId,
    this.number,
    this.totalPerson,
  });

  int? tableId;
  String? number;
  int? totalPerson;

  factory TablesDatum.fromJson(Map<String, dynamic> json) => TablesDatum(
    tableId: json["table_id"],
    number: json["number"],
    totalPerson: json["total_person"],
  );

  Map<String, dynamic> toJson() => {
    "table_id": tableId,
    "number": number,
    "total_person": totalPerson,
  };
}
