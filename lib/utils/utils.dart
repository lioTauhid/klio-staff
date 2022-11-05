import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/color.dart';
import '../constant/value.dart';

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

  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  static void showWarningDialog(String message, {Function()? onAccept}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: alternate,
        title: Row(
          children: [
            Icon(
              Icons.warning,
              color: Colors.orange,
            ),
            Text(' Warning!', style: TextStyle(color: primaryText)),
          ],
        ),
        content: Text(message, style: TextStyle(color: primaryText)),
        actions: [
          TextButton(
            onPressed: onAccept,
            child: Text("Yes"),
          ),
          TextButton(
            child: Text(
              "No",
              style: TextStyle(color: textSecondary),
            ),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  static void showInputDialog(
      String title, String message, TextEditingController controller,
      {Function()? onAccept}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: alternate,
        title: Row(
          children: [
            Icon(
              Icons.input,
              color: Colors.green,
            ),
            Text('  ' + title, style: TextStyle(color: primaryText)),
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: TextStyle(color: primaryText)),
            SizedBox(
              height: 40,
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller,
                  style:
                      TextStyle(fontSize: fontVerySmall, color: textSecondary),
                  decoration: InputDecoration(
                      fillColor: secondaryBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Type here...',
                      contentPadding: EdgeInsets.only(left: 5),
                      hintStyle: TextStyle(
                          fontSize: fontVerySmall, color: textSecondary))),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: onAccept,
            child: Text("Add"),
          ),
          TextButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: textSecondary),
            ),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  int execute(int func(int a, int b)) => func(4, 3);

  static void showSnackBar(String message) {
    Get.snackbar(
      "Information!",
      message,
      icon: Icon(Icons.error, color: Colors.indigo),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.lightBlue,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: white,
      duration: Duration(seconds: 5),
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
          (element.qty! *
              double.parse(Utils.findPriceByListId(
                  element.variants!.data!, element.variant!)));
      element.addons!.data!.forEach((addon) {
        adTotal = adTotal + (addon.qty! * double.parse(addon.price.toString()));
      });
    });
    return itemTotal + adTotal;
  }

  static double vatTotal(List<dynamic> list) {
    double itemTotal = 0;
    double adTotal = 0;
    double vatTotal = 0;
    list.forEach((element) {
      double vat = double.parse(element.taxVat.toString());
      itemTotal = itemTotal +
          (element.qty! *
              double.parse(Utils.findPriceByListId(
                  element.variants!.data!, element.variant!)));
      vatTotal = vatTotal + percentage(itemTotal, vat);
      element.addons!.data!.forEach((addon) {
        adTotal = adTotal + (addon.qty! * double.parse(addon.price.toString()));
      });
      vatTotal = vatTotal + percentage(adTotal, vat);
    });
    return vatTotal;
  }

  static double percentage(double total, double percentage) {
    return (total / 100) * percentage;
  }
}
