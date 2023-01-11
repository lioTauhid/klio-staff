import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/color.dart';
import '../constant/value.dart';
import '../mvc/model/menu.dart';
import '../mvc/model/menus.dart';

class Utils {

  static final apiHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };

  static String getTables(List list) {
    String tables = '';
    for (var element in list) {
      tables = '${element.number},$tables';
    }
    return tables;
  }

  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  static void hidePopup() {
    Get.back();
  }

  static void showSnackBar(String message) {
    Get.snackbar(
      "Information!",
      message,
      icon: Icon(Icons.error, color: Colors.indigo),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.lightBlue,
      borderRadius: 20,
      margin: EdgeInsets.only(right: 700),
      colorText: white,
      duration: Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static bool isPasswordValid(String password) {
    if (password.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  static bool isEmailValid(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  static int incrementDecrement(bool increment, int val) {
    if (increment) {
      val++;
    } else {
      if (val > 0) {
        val--;
      }
    }
    return val;
  }

  static String findPriceByListNearValue(List list, String nearItem) {
    for (var element in list) {
      if (element.name == nearItem) {
        return element.price.toString();
      }
    }
    return '';
  }

  static String findIdByListNearValue(List list, String nearItem) {
    for (var element in list) {
      if (element.name == nearItem) {
        return element.id.toString();
      }
    }
    return '';
  }

  static String findPriceByListId(List list, String id) {
    for (var element in list) {
      if (element.id == int.parse(id)) {
        return element.price.toString();
      }
    }
    return '';
  }

  static double calcSubTotal(List<dynamic> list) {
    double itemTotal = 0;
    double adTotal = 0;
    list.forEach((element) {
      itemTotal = itemTotal +
          (element.quantity! *
              double.parse(Utils.findPriceByListId(
                  element.variants!.data!, element.variant!)));
      element.addons!.data!.forEach((addon) {
        adTotal =
            adTotal + (addon.quantity! * double.parse(addon.price.toString()));
      });
    });
    return itemTotal + adTotal;
  }

  static double orderSubTotal(List<dynamic> list) {
    double itemTotal = 0;
    double adTotal = 0;
    list.forEach((element) {
      itemTotal = itemTotal + double.parse(element.totalPrice);
      element.addons!.data!.forEach((addon) {
        adTotal =
            adTotal + (addon.quantity! * double.parse(addon.price.toString()));
      });
    });
    return itemTotal + adTotal;
  }

  static double vatTotal(List<dynamic> list) {
    double itemTotal = 0;
    double vatTotal = 0;
    list.forEach((element) {
      double vat = double.parse(element.taxVat ?? '0');
      itemTotal = itemTotal +
          (element.quantity! *
              double.parse(Utils.findPriceByListId(
                  element.variants!.data!, element.variant!)));
      vatTotal = vatTotal + percentage(itemTotal, vat);
    });
    return vatTotal;
  }

  static double vatTotal2(List<dynamic> list) {
    double itemTotal = 0;
    double vatTotal = 0;
    list.forEach((element) {
      double vat = double.parse(element.vat.toString());
      itemTotal =
          itemTotal + (element.quantity! * double.parse(element.price!));
      vatTotal = vatTotal + percentage(itemTotal, vat);
    });
    return vatTotal;
  }

  static vatCount(List<dynamic> list) {
    double vatTotal = 0;
    list.forEach((element) {
      double vat = double.parse(element.vat.toString());
      vatTotal = vatTotal + vat;
    });
    return vatTotal;
  }

  static double percentage(double total, double percentage) {
    return (total / 100) * percentage;
  }

  static List<MenuData>? filterCategory(Menus menus, int id) {
    List<MenuData>? data = [];
    if (id == -1) {
      data = menus.data;
    } else {
      menus.data!.forEach((element) {
        element.categories!.forEach((catId) {
          if (catId == id) {
            data!.add(element);
          }
        });
      });
    }
    return data;
  }
}
