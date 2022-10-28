import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../../controller/home_controller.dart';
import '../dialog/custom_dialog.dart';
import '../widget/custom_widget.dart';

Widget leftSideView(BuildContext context) {
  HomeController homeController = Get.find();
  return Drawer(
    width: 400,
    elevation: 0,
    child: Container(
      height: double.infinity,
      color: secondaryBackground,
      padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconTextBtn(
                      'assets/dine-in.png', 'DINE IN', primaryColor, white,
                      onPressed: () {
                    showCustomDialog(context, "Table Reservation",
                        tableBody(context), 50, 200);
                  }),
                  iconTextBtn('assets/takeway.png', 'TAKEAWAY',
                      primaryBackground, primaryText,
                      onPressed: () {}),
                  iconTextBtn('assets/delivery.png', 'DELIVERY',
                      primaryBackground, primaryText,
                      onPressed: () {}),
                  iconTextBtn('assets/table.png', 'TABLE', primaryBackground,
                      primaryText, onPressed: () {
                    showCustomDialog(context, "Table Reservation",
                        tableBody(context), 50, 200);
                  }),
                ],
              ),
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
                              items: homeController.customer.value.data!
                                  .map((dynamic val) {
                                return DropdownMenuItem<String>(
                                  value: val.name.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(val.name,
                                        style: TextStyle(color: primaryText)),
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
                        onPressed: () {
                          showCustomDialog(
                              context,
                              "Update Customer",
                              addCustomer(context, onPressed: () {
                                print(homeController.controllerName.value.text);
                              }),
                              60,
                              400);
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
                          showCustomDialog(
                              context,
                              "Add Customer",
                              addCustomer(context, onPressed: () {
                                print(homeController.controllerName.value.text);
                                homeController.addCustomer();
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
              ListView.builder(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Text('Chicken Masala',
                                style: TextStyle(
                                    fontSize: fontSmall,
                                    color: primaryText,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                topBarIconBtn(
                                    Image.asset('assets/remove.png',
                                        color: primaryText),
                                    primaryBackground,
                                    0,
                                    2,
                                    16,
                                    onPressed: () {}),
                                SizedBox(width: 6),
                                Text('12',
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
                                    16,
                                    onPressed: () {}),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text('1.5',
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: fontVerySmall)),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text('12',
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
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: alternate,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("Ice cream 2x1.5",
                                  style: TextStyle(
                                      fontSize: fontVerySmall,
                                      color: primaryText))),
                          SizedBox(width: 5),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: alternate,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("Cheese 2x1.5",
                                  style: TextStyle(
                                      fontSize: fontVerySmall,
                                      color: primaryText))),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                // margin: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
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
                              'Service',
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              '£20',
                              style: TextStyle(
                                  color: primaryText,
                                  fontSize: fontVerySmall,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              '£5',
                              style: TextStyle(
                                  color: primaryText,
                                  fontSize: fontVerySmall,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              '£-10',
                              style: TextStyle(
                                  color: primaryText,
                                  fontSize: fontVerySmall,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              '£15',
                              style: TextStyle(
                                  fontSize: fontMedium,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iconTextBtnWide(
                        "assets/check.png", 'ORDER', primaryColor, white,
                        onPressed: () {}),
                    iconTextBtnWide(
                        "assets/credit-card.png", 'Pay', alternate, primaryText,
                        onPressed: () {}),
                    iconTextBtnWide(
                        "assets/print.png", 'Print', alternate, primaryText,
                        onPressed: () {}),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iconTextBtnWide("assets/percentage.png", 'Discout',
                        alternate, primaryText,
                        onPressed: () {}),
                    iconTextBtnWide(
                        "assets/add.png", 'Add Misc', alternate, primaryText,
                        onPressed: () {
                      showCustomDialog(context, "Update Customer",
                          addMisc(context), 30, 400);
                    }),
                    iconTextBtnWide(
                        "assets/delete.png", 'Delete', alternate, primaryText,
                        onPressed: () {}),
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
