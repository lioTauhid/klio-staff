import 'package:klio_staff/mvc/controller/home_controller.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

import '../../utils/utils.dart';

class CustomerDisplay {
  static Future<void> cartPrint(HomeController homeController) async {
    await SunmiPrinter.lcdWakeup(); //Turn the LCD ON
    String subTotal =
        await "Sub Total: £${Utils.calcSubTotal(homeController.cardList)}";
    String vatService =
        await "Service + Vat: £${homeController.settings.value.data![14].value} + £${Utils.vatTotal(homeController.cardList).toStringAsFixed(2)}";
    String discount =
        await "Discount: £-${homeController.discount.value.toStringAsFixed(2)}";
    String total =
        await "Total: £${((Utils.calcSubTotal(homeController.cardList) + double.parse(homeController.settings.value.data![14].value.toString()) + Utils.vatTotal(homeController.cardList)) - homeController.discount.value).toStringAsFixed(2)}";
    await SunmiPrinter.lcdMultiString([subTotal, vatService, discount, total],
        [1, 1, 1, 1]); // Write multiple lines with alignment
  }

  static Future<void> totalPayPrint(String total) async {
    await SunmiPrinter.lcdWakeup(); //Turn the LCD ON
    await SunmiPrinter.lcdMultiString(['Payable Amount: ', total], [1, 2]);
  }

  static Future<void> sleep() async {
    await SunmiPrinter.lcdClear(); //Clear LCD screen
    await SunmiPrinter.lcdSleep(); //Turn the LCD OFF
  }
}
