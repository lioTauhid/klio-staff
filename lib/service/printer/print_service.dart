import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:klio_staff/mvc/model/menu.dart';
import 'package:klio_staff/mvc/model/order.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import '../../../constant/value.dart';
import '../../../utils/utils.dart';
import '../../mvc/controller/home_controller.dart';
import 'package:pdf/pdf.dart';

HomeController homeController = Get.find();

class DefaultPrinter {
  static Future<void> startPrinting() async {
    final doc = pw.Document();

    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return invoicePage("method");
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  static pw.Widget textMixerPw(String boldText, String normalText) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      children: [
        pw.Text(
          boldText,
          style: pw.TextStyle(
              fontSize: fontVerySmall, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          normalText,
          style: pw.TextStyle(fontSize: fontVerySmall),
        ),
      ],
    );
  }

  static pw.Widget textMixer2Pw(
      String boldText, String normalText, MainAxisAlignment alignment) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          boldText,
          style: pw.TextStyle(fontSize: fontVerySmall),
        ),
        pw.Text(
          normalText,
          style: pw.TextStyle(fontSize: fontVerySmall),
        ),
      ],
    );
  }

  static pw.Widget invoicePage(String method) {
    return pw.Padding(
        padding: pw.EdgeInsets.symmetric(horizontal: 30),
        child: pw.Column(children: [
          pw.Center(
            child: pw.Text(
              'klio',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 40),
            ),
          ),
          pw.Center(
            child: pw.Text(
              'We are just preparing your food, and will bring it to \nyour table as soon as possible',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: fontVerySmall),
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              textMixerPw(
                  "Table: ",
                  Utils.getTables(
                      homeController.order.value.data!.tables!.data!.toList())),
              textMixerPw("Order Number: ",
                  homeController.order.value.data!.invoice.toString()),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Center(
            child: pw.Text(
              'Order Summary',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: fontVeryBig),
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Expanded(
                flex: 1,
                child: pw.Text(
                  "SL",
                  style: pw.TextStyle(
                    fontSize: fontVerySmall,
                  ),
                ),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(
                  "Name",
                  style: pw.TextStyle(fontSize: fontVerySmall),
                ),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(
                  "Variant Name",
                  style: pw.TextStyle(fontSize: fontVerySmall),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Text(
                  "Price",
                  style: pw.TextStyle(fontSize: fontVerySmall),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Text(
                  "Qty",
                  style: pw.TextStyle(fontSize: fontVerySmall),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Text(
                  "Vat",
                  style: pw.TextStyle(fontSize: fontVerySmall),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Text(
                  "Total",
                  style: pw.TextStyle(fontSize: fontVerySmall),
                ),
              ),
            ],
          ),
          pw.Divider(thickness: 1, height: 1),
          pw.Expanded(
              child: pw.ListView.builder(
                  itemCount: homeController
                      .order.value.data!.orderDetails!.data!.length,
                  itemBuilder: (context, int index) {
                    return pw.Column(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 5),
                          child: pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            children: [
                              pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  (index + 1).toString(),
                                  style: pw.TextStyle(
                                      fontSize: fontVerySmall,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Text(
                                  homeController.order.value.data!.orderDetails!
                                      .data![index].food!.name
                                      .toString(),
                                  style: pw.TextStyle(
                                      fontSize: fontVerySmall,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Text(
                                  homeController.order.value.data!.orderDetails!
                                      .data![index].variant!.name
                                      .toString(),
                                  style: pw.TextStyle(
                                      fontSize: fontVerySmall,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ),
                              pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "£${homeController.order.value.data!.orderDetails!.data![index].price}",
                                  style: pw.TextStyle(
                                      fontSize: fontVerySmall,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ),
                              pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  homeController.order.value.data!.orderDetails!
                                      .data![index].quantity
                                      .toString(),
                                  style: pw.TextStyle(
                                      fontSize: fontVerySmall,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ),
                              pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  homeController.order.value.data!.orderDetails!
                                      .data![index].vat
                                      .toString(),
                                  style: pw.TextStyle(
                                      fontSize: fontVerySmall,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ),
                              pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "£${homeController.order.value.data!.orderDetails!.data![index].totalPrice}",
                                  style: pw.TextStyle(
                                      fontSize: fontVerySmall,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        pw.Divider(thickness: 0.1, height: 0.1),
                        homeController.order.value.data!.orderDetails!
                                    .data![index].addons!.data!.length >
                                0
                            ? pw.Padding(
                                padding:
                                    const pw.EdgeInsets.symmetric(vertical: 2),
                                child: pw.Column(
                                  children: [
                                    pw.Row(
                                      children: [
                                        for (var addons in homeController
                                            .order
                                            .value
                                            .data!
                                            .orderDetails!
                                            .data![index]
                                            .addons!
                                            .data!
                                            .toList())
                                          pw.Container(
                                              padding: pw.EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 2),
                                              margin: pw.EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              decoration: pw.BoxDecoration(
                                                  borderRadius:
                                                      pw.BorderRadius.circular(
                                                          10)),
                                              child: pw.Text(
                                                  '${addons.name}  ${addons.quantity}x${addons.quantity}',
                                                  style:
                                                      pw.TextStyle(fontSize: fontVerySmall)))
                                      ],
                                    ),
                                    pw.Divider(thickness: 0.1, height: 0.1),
                                  ],
                                ),
                              )
                            : pw.SizedBox(),
                      ],
                    );
                  })),
          pw.SizedBox(height: 10),
          pw.Divider(thickness: 0.1, height: 0.1),
          textMixer2Pw(
              "Order Type",
              homeController.order.value.data!.type.toString(),
              MainAxisAlignment.spaceBetween),
          textMixer2Pw(
              "Subtotal",
              '£${double.parse(homeController.order.value.data!.grandTotal.toString()) + double.parse(homeController.order.value.data!.discount.toString()) - (double.parse(homeController.order.value.data!.deliveryCharge.toString()) + Utils.vatTotal2(homeController.order.value.data!.orderDetails!.data!.toList()) + double.parse(homeController.order.value.data!.serviceCharge.toString()))}',
              MainAxisAlignment.spaceBetween),
          textMixer2Pw(
              "Discount",
              '£' + homeController.order.value.data!.discount.toString(),
              MainAxisAlignment.spaceBetween),
          textMixer2Pw(
              "Vat",
              Utils.vatTotal2(homeController
                      .order.value.data!.orderDetails!.data!
                      .toList())
                  .toString(),
              MainAxisAlignment.spaceBetween),
          textMixer2Pw(
              "Service",
              '£' + homeController.order.value.data!.serviceCharge.toString(),
              MainAxisAlignment.spaceBetween),
          textMixer2Pw(
              "Give Amount",
              homeController.giveAmount.value.toString(),
              MainAxisAlignment.spaceBetween),
          textMixer2Pw(
              "Change Amount",
              (homeController.giveAmount.value -
                      double.parse(
                          homeController.order.value.data!.grandTotal!))
                  .toString(),
              MainAxisAlignment.spaceBetween),
          textMixer2Pw(
              "Payment Method", method, MainAxisAlignment.spaceBetween),
          textMixer2Pw(
              "Delivery Charge",
              '£' + homeController.order.value.data!.deliveryCharge.toString(),
              MainAxisAlignment.spaceBetween),
          pw.Divider(thickness: 0.1, height: 0.1),
          pw.SizedBox(height: 10),
          pw.Center(
            child: pw.Text(
              'Paid Amount',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: fontSmall),
            ),
          ),
          pw.Center(
            child: pw.Text(
              '£${double.parse(homeController.order.value.data!.grandTotal.toString()) + double.parse(homeController.order.value.data!.discount.toString()) - (double.parse(homeController.order.value.data!.deliveryCharge.toString()) + Utils.vatTotal2(homeController.order.value.data!.orderDetails!.data!.toList()) + double.parse(homeController.order.value.data!.serviceCharge.toString()))}',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: fontSmall),
            ),
          ),
          pw.Center(
            child: pw.Text(
              'Thanks for ordering with klio',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: fontSmall),
            ),
          ),
          pw.SizedBox(height: 10),
        ]));
  }
}

class SumniPrinter {
  static Future<void> printText() async {
    await SunmiPrinter.startTransactionPrint(true);

    await SunmiPrinter.setFontSize(SunmiFontSize.XL);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printText('klio');

    await SunmiPrinter.setFontSize(SunmiFontSize.MD);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printText(
        'We are just preparing your food, will \nbring it table as soon as possible');

    await SunmiPrinter.printText(
        'Table: ${Utils.getTables(homeController.order.value.data!.tables!.data!.toList())}              Order Number: ${homeController.order.value.data!.invoice.toString()}');
    await SunmiPrinter.lineWrap(2);

    await SunmiPrinter.setFontSize(SunmiFontSize.XL);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printText('Order Summary');

    await SunmiPrinter.setFontSize(SunmiFontSize.MD);
    await SunmiPrinter.printText('SL - Name - V. Name - Qty - Total');
    // await SunmiPrinter.printRow(cols: [
    //   ColumnMaker(text: 'SL', width: 1, align: SunmiPrintAlign.LEFT),
    //   ColumnMaker(text: 'Name', width: 3, align: SunmiPrintAlign.LEFT),
    //   ColumnMaker(text: 'V. Name', width: 2, align: SunmiPrintAlign.LEFT),
    //   ColumnMaker(text: 'Price', width: 2, align: SunmiPrintAlign.LEFT),
    //   ColumnMaker(text: 'Qty', width: 1, align: SunmiPrintAlign.LEFT),
    //   ColumnMaker(text: 'Total', width: 2, align: SunmiPrintAlign.LEFT),
    // ]);
    await SunmiPrinter.line();
    for (int i = 0;
        i < homeController.order.value.data!.orderDetails!.data!.length;
        i++) {
      OrderDetailsDatum item =
          await homeController.order.value.data!.orderDetails!.data![i];
      // await SunmiPrinter.printRow(cols: [
      //   ColumnMaker(text: (i+1).toString(), width: 1, align: SunmiPrintAlign.LEFT),
      //   ColumnMaker(text: item.food!.name!, width: 3, align: SunmiPrintAlign.LEFT),
      //   ColumnMaker(text: item.variant!.name!, width: 2, align: SunmiPrintAlign.LEFT),
      //   ColumnMaker(text: '${item.variant!.price}', width: 2, align: SunmiPrintAlign.LEFT),
      //   ColumnMaker(text: item.quantity!.toString(), width: 1, align: SunmiPrintAlign.LEFT),
      //   ColumnMaker(text: '${item.price!}', width: 2, align: SunmiPrintAlign.LEFT),
      // ]);
      await SunmiPrinter.printText(
          '${(i+1).toString()} - ${item.food!.name} - ${item.variant!.name} - ${item.quantity!} - ${item.totalPrice!}');
      for (AddonsDatum addons in homeController
          .order.value.data!.orderDetails!.data![i].addons!.data!
          .toList()) {
        await SunmiPrinter.printText('  ${addons.name}  ${addons.quantity}x${addons.price}');
      }
    }

    await SunmiPrinter.line();
    await SunmiPrinter.setFontSize(SunmiFontSize.MD);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
    await SunmiPrinter.printText(
        'Order Type: ${homeController.order.value.data!.type.toString()}');
    await SunmiPrinter.printText(
        'Subtotal: £${Utils.orderSubTotal(homeController.order.value.data!.orderDetails!.data!.toList()).toStringAsFixed(2)}');
    await SunmiPrinter.printText(
        'Discount: ${homeController.order.value.data!.discount.toString()}');
    await SunmiPrinter.printText(
        'Total Vat: ${Utils.vatCount(homeController.order.value.data!.orderDetails!.data!.toList()).toString()}%');
    await SunmiPrinter.printText(
        'Charges (Vat+Service+Delivery): ${Utils.vatTotal2(homeController.order.value.data!.orderDetails!.data!.toList()).toString()}+${homeController.order.value.data!.serviceCharge.toString()}+${homeController.order.value.data!.deliveryCharge.toString()}');
    await SunmiPrinter.printText(
        'Payment Method: ${homeController.payMethod.value}');
    await SunmiPrinter.line();

    await SunmiPrinter.printText(
        'Grand Total: ${homeController.order.value.data!.grandTotal}');
    await SunmiPrinter.printText(
        'Give Amount: ${homeController.giveAmount.value}');
    await SunmiPrinter.printText(
        'Due: ${(homeController.giveAmount.value - double.parse(homeController.order.value.data!.grandTotal!)).toStringAsFixed(2)}');

    await SunmiPrinter.lineWrap(2);
    await SunmiPrinter.setFontSize(SunmiFontSize.MD);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printText('Thanks for ordering with klio');

    // await SunmiPrinter.setCustomFontSize(20); // SET CUSTOM FONT 12
    // await SunmiPrinter.printText('Custom font size 20!!!');
    // await SunmiPrinter.resetFontSize(); // Reset font to medium size
    await SunmiPrinter.submitTransactionPrint(); // SUBMIT and cut paper
    await SunmiPrinter.cut(); // cut paper
    await SunmiPrinter.exitTransactionPrint(true); // Close the transaction
  }

  static Future<void> printImage() async {
    await SunmiPrinter.startTransactionPrint(true);

    String url =
        'https://raw.githubusercontent.com/andrey-ushakov/esc_pos_printer/master/example/receipt2.jpg';
    Uint8List byte = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        .buffer
        .asUint8List();
    await SunmiPrinter.printImage(byte);

    await SunmiPrinter.submitTransactionPrint(); // SUBMIT and cut paper
    await SunmiPrinter.cut(); // cut paper
    await SunmiPrinter.exitTransactionPrint(true); // Close the transaction
  }
}
