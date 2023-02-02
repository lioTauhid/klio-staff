import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klio_staff/mvc/model/Customer.dart';
import 'package:sunmi_printer_plus/column_maker.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../../../service/printer/customer_display.dart';
import '../../../service/printer/print_service.dart';
import '../../../utils/utils.dart';
import '../../controller/food_management_controller.dart';
import '../../controller/home_controller.dart';
import '../../model/menu.dart';
import '../dialog/custom_dialog.dart';
import '../widget/custom_widget.dart';

Widget leftSideView(BuildContext context, ScaffoldState? currentState) {
  HomeController homeController = Get.find();
  FoodManagementController foodCtlr = Get.find();

  return Drawer(
    width: 400,
    elevation: 0,
    child: Container(
      height: double.infinity,
      color: secondaryBackground,
      padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: Size.infinite.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.fromLTRB(6, 10, 6, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (int i = 1; i < 5; i++)
                            iconTextBtn(
                                orderTypes.entries.elementAt(i - 1).value,
                                orderTypes.entries.elementAt(i - 1).key,
                                homeController.topBtnPosition.value == i
                                    ? textSecondary
                                    : primaryBackground,
                                homeController.topBtnPosition.value == i
                                    ? white
                                    : primaryText, onPressed: () async {
                              homeController.topBtnPosition.value = i;
                              switch (i) {
                                case 1:
                                  Utils.showLoading();
                                  await homeController.getTables();
                                  Utils.hidePopup();
                                  showCustomDialog(context, "Table Reservation",
                                      tableBody(context, false), 50, 200);
                                  break;
                                case 2:
                                  homeController.withoutTable.value = true;
                                  break;
                                case 3:
                                  homeController.withoutTable.value = true;
                                  break;
                                default:
                                  homeController.withoutTable.value = false;
                                  // Utils.showLoading();
                                  homeController.getTables();
                                  // Utils.hidePopup();
                                  showCustomDialog(context, "Table Reservation",
                                      tableBody(context, true), 50, 200);
                                  break;
                              }
                            })
                        ],
                      ),
                    );
                  }),
                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                    decoration: BoxDecoration(
                      color: primaryBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Obx(() {
                                return DropdownButton<String>(
                                  items: homeController.customers.value.data!
                                      .map((dynamic val) {
                                    return DropdownMenuItem<String>(
                                      value: val.name.toString(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(val.name,
                                            style:
                                                TextStyle(color: primaryText)),
                                      ),
                                    );
                                  }).toList(),
                                  borderRadius: BorderRadius.circular(10),
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  dropdownColor: primaryBackground,
                                  value: homeController.customerName.toString(),
                                  onChanged: (value) {
                                    homeController.customerName.value = value!;
                                  },
                                );
                              })),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 26,
                          width: 26,
                          child: MaterialButton(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            color: secondaryBackground,
                            onPressed: () async {
                              Customer customer = await homeController
                                  .getCustomer(Utils.findIdByListNearValue(
                                      homeController.customers.value.data!
                                          .toList(),
                                      homeController.customerName.value));
                              homeController.controllerName.value.text =
                                  customer.data!.name! ?? '';
                              homeController.controllerEmail.value.text =
                                  customer.data!.email! ?? '';
                              homeController.controllerPhone.value.text =
                                  customer.data!.phone! ?? '';
                              homeController.controllerAddress.value.text =
                                  customer.data!.deliveryAddress! ?? '';
                              showCustomDialog(
                                  context,
                                  "Customer Details",
                                  addCustomer(context, true,
                                      customer: customer),
                                  60,
                                  400);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Image.asset(
                              "assets/user.png",
                              color: primaryText,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 26,
                          width: 26,
                          child: MaterialButton(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            color: secondaryBackground,
                            onPressed: () async {
                              showCustomDialog(
                                  context,
                                  "Update Customer",
                                  addCustomer(context, false, onPressed: () {
                                    //perform validation
                                    homeController.addUpdateCustomer(false,
                                        id: Utils.findIdByListNearValue(
                                            homeController.customers.value.data!
                                                .toList(),
                                            homeController.customerName.value));
                                  }),
                                  60,
                                  400);
                              Customer customer = await homeController
                                  .getCustomer(Utils.findIdByListNearValue(
                                      homeController.customers.value.data!
                                          .toList(),
                                      homeController.customerName.value));
                              homeController.controllerName.value.text =
                                  customer.data!.name!;
                              homeController.controllerEmail.value.text =
                                  customer.data!.email!;
                              homeController.controllerPhone.value.text =
                                  customer.data!.phone!;
                              homeController.controllerAddress.value.text =
                                  customer.data!.deliveryAddress!;
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Image.asset(
                              "assets/edit-alt.png",
                              color: primaryText,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 26,
                          width: 26,
                          child: MaterialButton(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            color: secondaryBackground,
                            onPressed: () {
                              homeController.controllerName.value.text = '';
                              homeController.controllerEmail.value.text = '';
                              homeController.controllerPhone.value.text = '';
                              homeController.controllerAddress.value.text = '';
                              showCustomDialog(
                                  context,
                                  "Add Customer",
                                  addCustomer(context, false, onPressed: () {
                                    homeController.addUpdateCustomer(true);
                                  }),
                                  60,
                                  400);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Image.asset(
                              "assets/add.png",
                              color: primaryText,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Text('Description',
                            style: TextStyle(
                                fontSize: fontVerySmall, color: textSecondary)),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text('Qty',
                            style: TextStyle(
                                fontSize: fontVerySmall, color: textSecondary)),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text('Rate',
                            style: TextStyle(
                                fontSize: fontVerySmall, color: textSecondary)),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text('Total',
                            style: TextStyle(
                                fontSize: fontVerySmall, color: textSecondary)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text('',
                            style: TextStyle(
                                fontSize: fontVerySmall, color: textSecondary)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Obx(() {
                      return ListView.builder(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        itemCount: homeController.cardList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Text(
                                        homeController.cardList[index].name
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: fontSmall,
                                            color: primaryText,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        topBarIconBtn(
                                            Image.asset('assets/remove.png',
                                                color: primaryText),
                                            primaryBackground,
                                            0,
                                            2,
                                            16, onPressed: () {
                                          homeController
                                                  .cardList[index].quantity =
                                              Utils.incrementDecrement(
                                                  false,
                                                  homeController
                                                      .cardList[index].quantity!
                                                      .toInt());
                                          homeController.cardList.refresh();
                                        }),
                                        SizedBox(width: 6),
                                        Text(
                                            homeController
                                                .cardList[index].quantity
                                                .toString(),
                                            style: TextStyle(
                                                color: primaryText,
                                                fontSize: fontVerySmall)),
                                        SizedBox(width: 6),
                                        topBarIconBtn(
                                            Image.asset('assets/add.png',
                                                color: primaryText),
                                            primaryBackground,
                                            0,
                                            2,
                                            16, onPressed: () {
                                          homeController
                                                  .cardList[index].quantity =
                                              Utils.incrementDecrement(
                                                  true,
                                                  homeController
                                                      .cardList[index].quantity!
                                                      .toInt());
                                          homeController.cardList.refresh();
                                        }),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                        Utils.findPriceByListId(
                                            homeController.cardList[index]
                                                .variants!.data!,
                                            homeController
                                                .cardList[index].variant!),
                                        style: TextStyle(
                                            color: primaryText,
                                            fontSize: fontVerySmall)),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                        "£${(homeController.cardList[index].quantity! * double.parse(Utils.findPriceByListId(homeController.cardList.value[index].variants!.data!, homeController.cardList.value[index].variant!)))}",
                                        style: TextStyle(
                                            color: primaryText,
                                            fontSize: fontVerySmall)),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.delete_forever_outlined,
                                        color: Colors.redAccent,
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        homeController.cardList.removeAt(index);
                                        homeController.cardList.refresh();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  for (AddonsDatum addons in homeController
                                      .cardList[index].addons!.data!)
                                    addons.isChecked == true
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            margin: EdgeInsets.only(right: 5),
                                            decoration: BoxDecoration(
                                                color: alternate,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                                '${addons.name}  ${addons.quantity}x${addons.price}',
                                                style: TextStyle(
                                                    fontSize: fontVerySmall,
                                                    color: primaryText)))
                                        : SizedBox(),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 8),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: alternate,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              'Sub Total',
                              style: TextStyle(
                                  color: primaryText, fontSize: fontVerySmall),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              'Service + Vat',
                              style: TextStyle(
                                  color: primaryText, fontSize: fontVerySmall),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              'Discount',
                              style: TextStyle(
                                  color: primaryText, fontSize: fontVerySmall),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              'Total',
                              style: TextStyle(
                                  color: primaryText,
                                  fontSize: fontMedium,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Obx(() {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                '£${Utils.calcSubTotal(homeController.cardList)}'
                                    .toString(),
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: fontVerySmall,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                '£${homeController.settings.value.data![14].value} + £${Utils.vatTotal(homeController.cardList).toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: fontVerySmall,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                '£-${homeController.discount.value.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: fontVerySmall,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                '£${((Utils.calcSubTotal(homeController.cardList) + double.parse(homeController.settings.value.data![14].value.toString()) + Utils.vatTotal(homeController.cardList)) - homeController.discount.value).toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: fontMedium,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Obx(() {
                return Padding(
                  padding: EdgeInsetsDirectional.only(top: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      iconTextBtnWide(
                          "assets/check.png",
                          homeController.isUpdate.value ? 'UPDATE' : 'ORDER',
                          primaryColor,
                          white, onPressed: () {
                        homeController.addUpdateOrder();
                        homeController.getOrders();
                        homeController.orders.refresh();
                        CustomerDisplay.sleep();
                      }),
                      iconTextBtnWide("assets/credit-card.png", 'Pay',
                          alternate, primaryText, onPressed: () async {
                        Utils.showLoading();
                        await homeController.getOrder(homeController.orders
                            .value.data![homeController.selectedOrder.value].id!
                            .toInt());
                        Utils.hidePopup();
                        showCustomDialog(context, "Order Details",
                            orderDetail(context), 50, 400);
                      }),
                      iconTextBtnWide(
                          "assets/print.png", 'Print', alternate, primaryText,
                          onPressed: () async {
                        Utils.showLoading();
                        homeController.giveAmount.value = 0;
                        homeController.payMethod.value = 'No Payment';
                        await homeController.getOrder(homeController.orders
                            .value.data![homeController.selectedOrder.value].id!
                            .toInt());
                        Utils.hidePopup();
                        showCustomDialog(
                            context,
                            "",
                            orderInvoice(
                                context, homeController.payMethod.value),
                            50,
                            800);
                      }),
                    ],
                  ),
                );
              }),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iconTextBtnWide("assets/percentage.png", 'Discount',
                        alternate, primaryText, onPressed: () {
                      TextEditingController controller =
                          TextEditingController();

                      showDiscountDialog('Add Discount in £', controller,
                          onAccept: () {
                        if (homeController.cardList.length == 0) {
                          Utils.showSnackBar('No cart item to discount');
                          return;
                        }
                        if (homeController.discType.value == discType[0]) {
                          homeController.discount.value =
                              double.parse(controller.text);
                        } else {
                          homeController.discount.value = Utils.percentage(
                              Utils.calcSubTotal(homeController.cardList) +
                                  Utils.percentage(
                                      Utils.calcSubTotal(
                                          homeController.cardList),
                                      double.parse(homeController
                                          .settings.value.data![14].value
                                          .toString())) +
                                  Utils.vatTotal(homeController.cardList),
                              double.parse(controller.text));
                        }
                        Get.back();
                      });
                    }),
                    iconTextBtnWide(
                        "assets/add.png", 'Add Misc', alternate, primaryText,
                        onPressed: () async {
                          await showCustomDialog(
                              context, "Add New menu", addNewMenuForm(foodCtlr), 30, 400);
                          await homeController.getMenuByKeyword();
                          homeController.menus.refresh();
                          // showCustomDialog(
                      //     context, "Add Food Menu", addMisc(context), 30, 400);
                    }),
                    iconTextBtnWide(
                        "assets/delete.png", 'Delete', alternate, primaryText,
                        onPressed: () {
                      homeController.isUpdate.value = false;
                      homeController.cardList.clear();
                      CustomerDisplay.sleep();
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
