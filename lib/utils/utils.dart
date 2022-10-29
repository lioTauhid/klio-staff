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

  static String getTables(List list){
    String tables = '';
    for (var element in list) {
      tables='${element.number},$tables';
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

  static void showWarningDialog(BuildContext context, String message, {Function? onAccept}) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.orange,
              ),
              Text(' Warning!'),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                onAccept;
              },
              child: Text("Yes"),
            ),
            TextButton(
              child: Text("No"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  static void showSnackBar(String message) {
    Get.snackbar(
      "Information!",
      message,
      icon: Icon(Icons.error),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.lightBlue,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: white,
      duration: Duration(seconds: 4),
      isDismissible: true,
    );
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(
    //     message,
    //   ),
    //   duration: Duration(seconds: 5),
    //   backgroundColor: secondaryColor,
    //   action: SnackBarAction(
    //     label: 'Ok',
    //     textColor: white,
    //     onPressed: () {
    //       // Some code to undo the change.
    //     },
    //   ),
    // ));
  }

  static bool isPasswordValid(String password){
    if(password.length>=6){
      return true;
    }else{
      return false;
    }
  }

  static bool isEmailValid(String email){
    RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }
}