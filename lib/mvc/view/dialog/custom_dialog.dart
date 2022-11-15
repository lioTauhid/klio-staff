import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:klio_staff/mvc/model/menu.dart';
import 'package:klio_staff/utils/utils.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../../../service/printer/print_service.dart';
import '../../controller/home_controller.dart';
import '../widget/custom_widget.dart';

HomeController homeController = Get.find();

Future<void> showCustomDialog(BuildContext context, String title, Widget widget,
    int heightReduce, int widthReduce) async {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width - widthReduce,
            height: MediaQuery.of(context).size.height - heightReduce,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondaryBackground,
            ),
            child: Column(
              children: [
                dialogHeader(title, context),
                // Divider(color: textSecondary, thickness: 1),
                const SizedBox(height: 10),
                Expanded(
                  child: widget,
                ),
              ],
            ),
          ));
    },
  );
}

void showWarningDialog(String message, {Function()? onAccept}) {
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

void showInputDialog(
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
                style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
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

void showDiscountDialog(String title, TextEditingController controller,
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
          Text("Value to discount", style: TextStyle(color: primaryText)),
          SizedBox(
            height: 40,
            child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller,
                style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
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
          SizedBox(height: 15),
          Text('Discount Type', style: TextStyle(color: primaryText)),
          Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: textSecondary, width: 1)),
              child: Obx(() {
                return DropdownButton<String>(
                  items: discType.map((dynamic val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(val, style: TextStyle(color: primaryText)),
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(8),
                  underline: SizedBox(),
                  isExpanded: true,
                  dropdownColor: primaryBackground,
                  value: homeController.discType.toString(),
                  onChanged: (value) {
                    homeController.discType.value = value!;
                  },
                );
              }))
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

Widget dialogHeader(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: primaryText),
        ),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: textSecondary,
          ),
        ),
      ],
    ),
  );
}

Widget addCustomer(BuildContext context, {Function()? onPressed}) {
  return Container(
    height: Size.infinite.height,
    width: Size.infinite.width,
    padding: EdgeInsets.all(30),
    child: ListView(children: [
      Text(
        'Name*',
        style: TextStyle(fontSize: fontMediumExtra, color: primaryText),
      ),
      SizedBox(height: 10),
      normalTextField(homeController.controllerName.value),
      SizedBox(height: 10),
      Text(
        'Email',
        style: TextStyle(fontSize: fontMediumExtra, color: primaryText),
      ),
      SizedBox(height: 10),
      normalTextField(homeController.controllerEmail.value),
      SizedBox(height: 10),
      Text(
        'Phone*',
        style: TextStyle(fontSize: fontMediumExtra, color: primaryText),
      ),
      SizedBox(height: 10),
      normalTextField(homeController.controllerPhone.value),
      SizedBox(height: 10),
      Text(
        'Delivery Address',
        style: TextStyle(fontSize: fontMediumExtra, color: primaryText),
      ),
      SizedBox(height: 10),
      normalTextField(homeController.controllerAddress.value),
      SizedBox(height: 10),
      SizedBox(height: 10),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          normalButton('Submit', primaryColor, white, onPressed: onPressed),
        ],
      ),
    ]),
  );
}

Widget foodMenuBody(BuildContext context, MenuData data) {
  homeController.menuData.value = data;
  homeController.menuData.value.quantity = 0;
  for (int i = 0; i < homeController.menuData.value.addons!.data!.length; i++) {
    homeController.menuData.value.addons!.data![i].quantity = 0;
    homeController.menuData.value.addons!.data![i].isChecked = false;
  }
  homeController.variantPrice.value = 0;
  double unitPrice = double.parse(data.variants!.data![0].price.toString()) ??
      double.parse(homeController.menuData.value.price.toString());
  homeController.menuData.value.variant = data.variants!.data![0].id.toString();
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "Name",
              style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Size",
              style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Qty",
              style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Price",
              style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
            ),
          ),
        ],
      ),
      Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(data.name.toString(),
                  style: TextStyle(
                      fontSize: fontMedium,
                      color: primaryText,
                      fontWeight: FontWeight.bold)),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  height: 35,
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: textSecondary, width: 1)),
                  child: DropdownButton<String>(
                    items: data.variants!.data!.map((dynamic val) {
                      return DropdownMenuItem<String>(
                        value: val.name.toString(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(val.name,
                              style: TextStyle(
                                  color: primaryText, fontSize: fontVerySmall)),
                        ),
                      );
                    }).toList(),
                    borderRadius: BorderRadius.circular(10),
                    underline: SizedBox(),
                    isExpanded: true,
                    dropdownColor: primaryBackground,
                    value: data.variants!.data![0].name,
                    onChanged: (value) {
                      unitPrice = double.parse(Utils.findPriceByListNearValue(
                          data.variants!.data!, value!));
                      // homeController.menuData.value.variant = unitPrice.toString();
                      // for store variant as id
                      homeController.menuData.value.variant =
                          Utils.findIdByListNearValue(
                              data.variants!.data!, value);
                      print(homeController.menuData.value.variant);
                    },
                  )),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  topBarIconBtn(Image.asset('assets/remove.png', color: white),
                      primaryColor, 0, 2, 14, onPressed: () {
                    homeController.menuData.value.quantity =
                        Utils.incrementDecrement(false,
                            homeController.menuData.value.quantity!.toInt());
                    homeController.menuData.refresh();
                  }),
                  SizedBox(width: 6),
                  Text(homeController.menuData.value.quantity.toString(),
                      style:
                          TextStyle(color: primaryText, fontSize: fontMedium)),
                  SizedBox(width: 6),
                  topBarIconBtn(Image.asset('assets/add.png', color: white),
                      primaryColor, 0, 2, 14, onPressed: () {
                    homeController.menuData.value.quantity =
                        Utils.incrementDecrement(true,
                            homeController.menuData.value.quantity!.toInt());
                    homeController.menuData.refresh();
                  }),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                  "£${(homeController.menuData.value.quantity! * unitPrice)}",
                  style: TextStyle(
                      fontSize: fontMedium,
                      color: primaryText,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        );
      }),
      Divider(color: textSecondary, thickness: 1),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Selection",
              style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "Addon Name",
              style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Qty",
              style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Price",
              style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
            ),
          ),
        ],
      ),
      Expanded(child: Obx(() {
        return ListView.builder(
            itemCount: homeController.menuData.value.addons!.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 60.0),
                          child: Checkbox(
                              value: homeController.menuData.value.addons!
                                  .data![index].isChecked,
                              onChanged: (checked) {
                                homeController.menuData.value.addons!
                                    .data![index].isChecked = checked!;
                                homeController.menuData.refresh();
                              }))),
                  Expanded(
                    flex: 3,
                    child: Text(
                        homeController.menuData.value.addons!.data![index].name
                            .toString(),
                        style: TextStyle(
                            fontSize: fontSmall,
                            color: primaryText,
                            fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        topBarIconBtn(
                            Image.asset('assets/remove.png', color: white),
                            primaryColor,
                            0,
                            2,
                            14, onPressed: () {
                          homeController.menuData.value.addons!.data![index]
                                  .quantity =
                              Utils.incrementDecrement(
                                  false,
                                  homeController.menuData.value.addons!
                                      .data![index].quantity!
                                      .toInt());
                          homeController.menuData.refresh();
                        }),
                        SizedBox(width: 6),
                        Text(
                            homeController
                                .menuData.value.addons!.data![index].quantity
                                .toString(),
                            style: TextStyle(
                                color: primaryText,
                                fontSize: fontSmall,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 6),
                        topBarIconBtn(
                            Image.asset('assets/add.png', color: white),
                            primaryColor,
                            0,
                            2,
                            14, onPressed: () {
                          homeController.menuData.value.addons!.data![index]
                                  .quantity =
                              Utils.incrementDecrement(
                                  true,
                                  homeController.menuData.value.addons!
                                      .data![index].quantity!
                                      .toInt());
                          homeController.menuData.refresh();
                        }),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                        "£${homeController.menuData.value.addons!.data![index].quantity! * double.parse(homeController.menuData.value.addons!.data![index].price.toString())}",
                        style: TextStyle(
                            fontSize: fontSmall,
                            color: primaryText,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              );
            });
      })),
      MaterialButton(
          elevation: 0,
          color: primaryColor,
          height: 40,
          minWidth: 160,
          // padding: EdgeInsets.all(20),
          onPressed: () {
            homeController.cardList.add(homeController.menuData.value);
            Get.back();
            print(homeController.menuData.value.toJson());
            // print(homeController.menuData.value.qty);
            // print(homeController.menuData.value.addons!.data);
            // print(homeController.menuData.value.addons!.data![0].qty);
            // print(homeController.menuData.value.addons!.data![1].qty);
            // print(homeController.menuData.value.addons!.data![1].isChecked);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/shopping-cart.png',
                color: white,
                height: 15,
                width: 15,
              ),
              SizedBox(width: 5),
              Text("Add to cart",
                  style: TextStyle(color: white, fontSize: fontSmall)),
            ],
          )),
    ]),
  );
}

Widget tableBody(BuildContext context, bool showOnly) {
  Size size = MediaQuery.of(context).size;
  ScrollController _scrollController = ScrollController();
  for (int i = 0; i < homeController.tables.value.data!.length; i++) {
    homeController.tables.value.data![i].message = '';
    homeController.tables.value.data![i].person = 0;
  }
  homeController.withoutTable.value = false;

  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Expanded(
        child: RawScrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 12,
          thumbColor: primaryColor,
          radius: Radius.circular(20),
          controller: _scrollController,
          child: Obx(() {
            return GridView.builder(
                padding: EdgeInsets.zero,
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width > size.height ? 3 : 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: showOnly ? 2 : 1.5,
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.tables.value.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: textSecondary, width: .3)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  homeController.tables.value.data![index].name
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: fontBig,
                                      fontWeight: FontWeight.bold,
                                      color: primaryText),
                                ),
                                Text(
                                    'Sit capacity: ${homeController.tables.value.data![index].capacity.toString()} Available: ${homeController.tables.value.data![index].available.toString()}',
                                    style: TextStyle(
                                        fontSize: fontVerySmall,
                                        color: primaryText)),
                              ],
                            ),
                            Image.network(
                              // "assets/table2.png",
                              homeController.tables.value.data![index].image
                                  .toString(),
                              height: 60,
                              width: 60,
                              fit: BoxFit.fill,
                              color: primaryColor,
                            )
                          ],
                        ),
                        Container(
                          height: .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: textSecondary, width: .3)),
                        ),
                        // SizedBox(height: 15),
                        // Text("Running Order In Table",
                        //     style: TextStyle(
                        //         fontSize: fontSmall,
                        //         color: primaryText,
                        //         fontWeight: FontWeight.bold)),
                        // SizedBox(height: 10),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //         flex: 2,
                        //         child: Text(
                        //           'Order',
                        //           style: TextStyle(
                        //               color: textSecondary,
                        //               fontSize: fontVerySmall),
                        //         )),
                        //     Expanded(
                        //         flex: 3,
                        //         child: Text(
                        //           'Time',
                        //           style: TextStyle(
                        //               color: textSecondary,
                        //               fontSize: fontVerySmall),
                        //         )),
                        //     Expanded(
                        //         flex: 2,
                        //         child: Text(
                        //           'Person',
                        //           style: TextStyle(
                        //               color: textSecondary,
                        //               fontSize: fontVerySmall),
                        //         )),
                        //     Expanded(
                        //         flex: 1,
                        //         child: Text(
                        //           '',
                        //           style: TextStyle(
                        //               color: textSecondary,
                        //               fontSize: fontVerySmall),
                        //         )),
                        //   ],
                        // ),
                        // SizedBox(height: 10),
                        // Expanded(
                        //   child: ListView.builder(
                        //       itemCount: 3,
                        //       itemBuilder: (BuildContext context, int index) {
                        //         return Column(
                        //           children: [
                        //             Row(
                        //               children: [
                        //                 Expanded(
                        //                     flex: 2,
                        //                     child: Text('#A002',
                        //                         style: TextStyle(
                        //                             fontSize: fontSmall,
                        //                             color: primaryText,
                        //                             fontWeight:
                        //                                 FontWeight.bold))),
                        //                 Expanded(
                        //                     flex: 3,
                        //                     child: Text('7:30AM\n2/5/2022',
                        //                         style: TextStyle(
                        //                             fontSize: fontSmall,
                        //                             color: primaryText,
                        //                             fontWeight:
                        //                                 FontWeight.bold))),
                        //                 Expanded(
                        //                   flex: 2,
                        //                   child: Text('2',
                        //                       style: TextStyle(
                        //                           fontSize: fontSmall,
                        //                           color: primaryText,
                        //                           fontWeight: FontWeight.bold)),
                        //                 ),
                        //                 Expanded(
                        //                     flex: 1,
                        //                     child: IconButton(
                        //                       onPressed: () {},
                        //                       icon: Image.asset(
                        //                         "assets/delete.png",
                        //                         color: Colors.red,
                        //                         height: 18,
                        //                         width: 18,
                        //                       ),
                        //                     )),
                        //               ],
                        //             ),
                        //             Container(
                        //               height: .5,
                        //               decoration: BoxDecoration(
                        //                   borderRadius: BorderRadius.circular(8),
                        //                   border: Border.all(
                        //                       color: textSecondary, width: .3)),
                        //             ),
                        //           ],
                        //         );
                        //       }),
                        // ),
                        SizedBox(height: 30),
                        showOnly
                            ? SizedBox()
                            : SizedBox(
                                height: 45,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                          onChanged: (text) {
                                            if (text == '') {
                                              homeController.tables.value
                                                  .data![index].person = 0;
                                              homeController.tables.refresh();
                                            }
                                            print(text);
                                            if (homeController.tables.value
                                                    .data![index].available! >=
                                                int.parse(text ?? '0')) {
                                              homeController
                                                  .tables
                                                  .value
                                                  .data![index]
                                                  .person = int.parse(text);
                                              homeController.tables.value
                                                  .data![index].message = '';
                                              homeController.tables.refresh();
                                            } else {
                                              homeController.tables.value
                                                  .data![index].person = 0;
                                              homeController.tables.value
                                                      .data![index].message =
                                                  'Available sit is not smaller than entered person!';
                                              homeController.tables.refresh();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: fontVerySmall,
                                              color: primaryText),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                borderSide: BorderSide(
                                                    color: textSecondary,
                                                    width: .5),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              hintStyle: TextStyle(
                                                  fontSize: fontVerySmall,
                                                  color: primaryText),
                                              hintText: 'Person')),
                                    ),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    // Expanded(
                                    //   flex: 2,
                                    //   child: MaterialButton(
                                    //       elevation: 0,
                                    //       color: primaryColor,
                                    //       height: 45,
                                    //       // minWidth: 180,
                                    //       // padding: EdgeInsets.all(20),
                                    //       onPressed: () {},
                                    //       shape: RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.circular(40),
                                    //       ),
                                    //       child: Text(
                                    //         "Add",
                                    //         style: TextStyle(
                                    //             color: white,
                                    //             fontSize: fontVerySmall),
                                    //       )),
                                    // ),
                                  ],
                                ),
                              ),
                        Expanded(
                          child: Text(
                              homeController
                                      .tables.value.data![index].message ??
                                  '',
                              style: TextStyle(color: Colors.red)),
                        )
                      ],
                    ),
                  );
                });
          }),
        ),
      ),
      Container(
        height: .4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: textSecondary, width: .3)),
      ),
      SizedBox(
        height: 10,
      ),
      showOnly
          ? SizedBox()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                normalButton(
                    'Process without table', Colors.transparent, textSecondary,
                    onPressed: () {
                  homeController.withoutTable.value = true;
                  homeController.tables.value.data!.clear();
                  Get.back();
                }),
                normalButton('Please read', primaryBackground, primaryText,
                    onPressed: () {}),
                SizedBox(width: 100),
                normalButton('Submit', primaryColor, white, onPressed: () {
                  print(homeController.tables.value.toJson());
                  bool error = false;
                  for (var element in homeController.tables.value.data!) {
                    if (element.message != '') {
                      error = true;
                      break;
                    }
                  }
                  if (error) {
                    Utils.showSnackBar("Check the person filed is valid!");
                  } else {
                    for (var element in homeController.tables.value.data!) {
                      if (element.person != 0) {
                        error = false;
                        break;
                      } else {
                        error = true;
                      }
                    }
                    if (!error) {
                      homeController.withoutTable.value = true;
                      Get.back();
                    } else
                      Utils.showSnackBar("Check the person filed is empty!");
                  }
                }),
              ],
            ),
    ]),
  );
}

Widget orderDetail(BuildContext context, [bool kitchen = false]) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
    child: GetBuilder(builder: (HomeController homeController) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 1,
                child: textMixer(
                    'Order Type: ',
                    homeController.order.value.data!.type.toString(),
                    MainAxisAlignment.start)),
            Expanded(
                flex: 1,
                child: textMixer(
                    'Customer Name: ',
                    homeController.order.value.data!.customer!.name.toString(),
                    MainAxisAlignment.start)),
            Expanded(
                flex: 1,
                child: textMixer(
                    'Invoice: ',
                    homeController.order.value.data!.invoice.toString(),
                    MainAxisAlignment.center)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 1,
                child: textMixer(
                    'Table Number: ',
                    Utils.getTables(homeController
                        .order.value.data!.tables!.data!
                        .toList()),
                    MainAxisAlignment.start)),
            Expanded(
                flex: 1,
                child: textMixer(
                    'Processing Time: ',
                    homeController.order.value.data!.processingTime.toString(),
                    MainAxisAlignment.start)),
            Expanded(
                flex: 1,
                child: textMixer(
                    'Price: ',
                    '£' +
                        homeController.order.value.data!.grandTotal.toString(),
                    MainAxisAlignment.center)),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "NO",
                style: TextStyle(
                    fontSize: fontVerySmall,
                    color: primaryText,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "Name",
                style: TextStyle(
                    fontSize: fontVerySmall,
                    color: primaryText,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "Variant Name",
                style: TextStyle(
                    fontSize: fontVerySmall,
                    color: primaryText,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Price",
                style: TextStyle(
                    fontSize: fontVerySmall,
                    color: primaryText,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Qty",
                style: TextStyle(
                    fontSize: fontVerySmall,
                    color: primaryText,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Vat",
                style: TextStyle(
                    fontSize: fontVerySmall,
                    color: primaryText,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Total",
                style: TextStyle(
                    fontSize: fontVerySmall,
                    color: primaryText,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Divider(color: textSecondary, thickness: 0.1, height: 0.1),
        Expanded(
            child: ListView.builder(
                itemCount:
                    homeController.order.value.data!.orderDetails!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                    fontSize: fontVerySmall,
                                    color: primaryText,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                homeController.order.value.data!.orderDetails!
                                    .data![index].food!.name
                                    .toString(),
                                style: TextStyle(
                                    fontSize: fontVerySmall,
                                    color: textSecondary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                homeController.order.value.data!.orderDetails!
                                    .data![index].variant!.name
                                    .toString(),
                                style: TextStyle(
                                    fontSize: fontVerySmall,
                                    color: textSecondary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "£${homeController.order.value.data!.orderDetails!.data![index].price}",
                                style: TextStyle(
                                    fontSize: fontVerySmall,
                                    color: textSecondary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                homeController.order.value.data!.orderDetails!
                                    .data![index].quantity
                                    .toString(),
                                style: TextStyle(
                                    fontSize: fontVerySmall,
                                    color: textSecondary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                homeController.order.value.data!.orderDetails!
                                    .data![index].vat
                                    .toString(),
                                style: TextStyle(
                                    fontSize: fontVerySmall,
                                    color: textSecondary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "£${homeController.order.value.data!.orderDetails!.data![index].totalPrice}",
                                style: TextStyle(
                                    fontSize: fontVerySmall,
                                    color: textSecondary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                          color: textSecondary, thickness: 0.1, height: 0.1),
                      homeController.order.value.data!.orderDetails!
                                  .data![index].addons!.data!.length >
                              0
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                children: [
                                  Row(
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
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                                color: alternate,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                                '${addons.name}  ${addons.quantity}x${addons.quantity}',
                                                style: TextStyle(
                                                    fontSize: fontVerySmall,
                                                    color: textSecondary)))
                                    ],
                                  ),
                                  Divider(
                                      color: textSecondary,
                                      thickness: 0.1,
                                      height: 0.1),
                                ],
                              ),
                            )
                          : SizedBox(),
                    ],
                  );
                })),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 1,
                child: textMixer(
                    'Total Item: ',
                    homeController.order.value.data!.orderDetails!.data!.length
                        .toString(),
                    MainAxisAlignment.start)),
            Expanded(
                flex: 1,
                child: textMixer(
                    'Sub Total: ',
                    '£${double.parse(homeController.order.value.data!.grandTotal.toString()) + double.parse(homeController.order.value.data!.discount.toString()) - (double.parse(homeController.order.value.data!.deliveryCharge.toString()) + Utils.vatTotal2(homeController.order.value.data!.orderDetails!.data!.toList()) + double.parse(homeController.order.value.data!.serviceCharge.toString()))}',
                    MainAxisAlignment.start)),
            Expanded(
                flex: 1,
                child: textMixer(
                    'Service Charge: ',
                    '£' +
                        homeController.order.value.data!.serviceCharge
                            .toString(),
                    MainAxisAlignment.center)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 1,
                child: textMixer(
                    'Delivery Charge: ',
                    '£' +
                        homeController.order.value.data!.deliveryCharge
                            .toString(),
                    MainAxisAlignment.start)),
            Expanded(
                flex: 1,
                child: textMixer(
                    'VAT: ',
                    Utils.vatTotal2(homeController
                            .order.value.data!.orderDetails!.data!
                            .toList())
                        .toString(),
                    MainAxisAlignment.start)),
            // child: textMixer('VAT: ', Utils.vatTotal(homeController.order.value.data!.orderDetails!.data!.toList()).toString(), MainAxisAlignment.start)),
            Expanded(
                flex: 1,
                child: textMixer(
                    'Discount: ',
                    '£' + homeController.order.value.data!.discount.toString(),
                    MainAxisAlignment.center)),
          ],
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            'Grand Total: £${homeController.order.value.data!.grandTotal}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSmall,
                color: textSecondary),
          ),
        ),
        Expanded(child: SizedBox(height: 500)),
        kitchen? SizedBox():Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            normalButton('Create Invoice', primaryColor, white, onPressed: () {
              Utils.hidePopup();
              showCustomDialog(
                  context, "Finalize Order", finalizeOrder(context), 200, 600);
            }),
            normalButton('Close', textSecondary, white,
                onPressed: () => Get.back()),
          ],
        )
      ]);
    }),
  );
}

Widget finalizeOrder(BuildContext context) {
  String method = paymentType[0];
  return Container(
    height: Size.infinite.height,
    width: Size.infinite.width,
    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Center(
          child: Text(
            'Reward: £${12}',
            style: TextStyle(fontSize: fontSmall, color: primaryText),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(value: true, onChanged: (checked) {}),
            Text(
              'Use Rewards: £${12}',
              style: TextStyle(fontSize: fontSmall, color: primaryText),
            ),
            Expanded(child: SizedBox(width: Size.infinite.width)),
            Text(
              'Payable Amount: £${homeController.order.value.data!.grandTotal}',
              style: TextStyle(fontSize: fontSmall, color: primaryText),
            ),
          ],
        ),
        SizedBox(height: 15),
        Text(
          "Payment Method",
          style: TextStyle(fontSize: fontSmall, color: primaryText),
        ),
        Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: primaryText, width: 1)),
            child: DropdownButton<String>(
              items: paymentType.map((dynamic val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(val, style: TextStyle(color: primaryText)),
                  ),
                );
              }).toList(),
              borderRadius: BorderRadius.circular(8),
              underline: SizedBox(),
              isExpanded: true,
              dropdownColor: primaryBackground,
              value: 'Card',
              onChanged: (value) => method = value!,
            )),
        SizedBox(height: 15),
        Text(
          'Give Amount',
          style: TextStyle(fontSize: fontSmall, color: primaryText),
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (text) =>
                  homeController.giveAmount.value = int.parse(text),
              style: TextStyle(fontSize: fontVerySmall, color: primaryText),
              decoration: InputDecoration(
                  fillColor: secondaryBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.only(left: 5),
                  hintStyle:
                      TextStyle(fontSize: fontVerySmall, color: primaryText))),
        ),
        SizedBox(height: 15),
        Text(
          "Change Amount",
          style: TextStyle(fontSize: fontSmall, color: primaryText),
        ),
        Container(
            height: 40,
            width: Size.infinite.width,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: primaryText, width: 1)),
            child: Obx(() {
              return Text(
                (homeController.giveAmount.value -
                        double.parse(
                            homeController.order.value.data!.grandTotal!))
                    .toString(),
                style: TextStyle(fontSize: fontSmall, color: primaryText),
              );
            })),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            normalButton('Close', textSecondary, white, onPressed: () {
              Get.back();
            }),
            SizedBox(width: 20),
            normalButton('Submit', primaryColor, white, onPressed: () async {
              // showCustomDialog(
              //     context, "", orderInvoice(context, method), 0, 800);
              bool done = await homeController.orderPayment(method);
              if (done) {
                showCustomDialog(
                    context, "", orderInvoice(context, method), 50, 800);
              } else
                Utils.showSnackBar("Something wrong, try again");
            }),
          ],
        )
      ],
    ),
  );
}

Widget orderInvoice(BuildContext context, String method) {
  return Column(
    children: [
      Expanded(
          flex: 18,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(children: [
                Center(
                  child: Text(
                    'klio',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: textSecondary),
                  ),
                ),
                Center(
                  child: Text(
                    'We are just preparing your food, and will bring it to \nyour table as soon as possible',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontVerySmall,
                        color: textSecondary),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textMixer(
                        "Table: ",
                        Utils.getTables(homeController
                            .order.value.data!.tables!.data!
                            .toList()),
                        MainAxisAlignment.start),
                    textMixer(
                        "Order Number: ",
                        homeController.order.value.data!.invoice.toString(),
                        MainAxisAlignment.start),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Order Summary',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontVeryBig,
                        color: primaryText),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "SL",
                        style: TextStyle(
                          fontSize: fontVerySmall,
                          color: primaryText,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Name",
                        style: TextStyle(
                            fontSize: fontVerySmall, color: primaryText),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Variant Name",
                        style: TextStyle(
                            fontSize: fontVerySmall, color: primaryText),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Price",
                        style: TextStyle(
                            fontSize: fontVerySmall, color: primaryText),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Qty",
                        style: TextStyle(
                            fontSize: fontVerySmall, color: primaryText),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Vat",
                        style: TextStyle(
                            fontSize: fontVerySmall, color: primaryText),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Total",
                        style: TextStyle(
                            fontSize: fontVerySmall, color: primaryText),
                      ),
                    ),
                  ],
                ),
                Divider(color: textSecondary, thickness: 1, height: 1),
                Expanded(
                    child: ListView.builder(
                        itemCount: homeController
                            .order.value.data!.orderDetails!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                            fontSize: fontVerySmall,
                                            color: primaryText,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        homeController
                                            .order
                                            .value
                                            .data!
                                            .orderDetails!
                                            .data![index]
                                            .food!
                                            .name
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: fontVerySmall,
                                            color: textSecondary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        homeController
                                            .order
                                            .value
                                            .data!
                                            .orderDetails!
                                            .data![index]
                                            .variant!
                                            .name
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: fontVerySmall,
                                            color: textSecondary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "£${homeController.order.value.data!.orderDetails!.data![index].price}",
                                        style: TextStyle(
                                            fontSize: fontVerySmall,
                                            color: textSecondary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        homeController.order.value.data!
                                            .orderDetails!.data![index].quantity
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: fontVerySmall,
                                            color: textSecondary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        homeController.order.value.data!
                                            .orderDetails!.data![index].vat
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: fontVerySmall,
                                            color: textSecondary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "£${homeController.order.value.data!.orderDetails!.data![index].totalPrice}",
                                        style: TextStyle(
                                            fontSize: fontVerySmall,
                                            color: textSecondary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                  color: textSecondary,
                                  thickness: 0.1,
                                  height: 0.1),
                              homeController.order.value.data!.orderDetails!
                                          .data![index].addons!.data!.length >
                                      0
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Column(
                                        children: [
                                          Row(
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
                                                Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 2),
                                                    margin: EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                        color: alternate,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10)),
                                                    child: Text(
                                                        '${addons.name}  ${addons.quantity}x${addons.quantity}',
                                                        style: TextStyle(
                                                            fontSize:
                                                                fontVerySmall,
                                                            color:
                                                                textSecondary)))
                                            ],
                                          ),
                                          Divider(
                                              color: textSecondary,
                                              thickness: 0.1,
                                              height: 0.1),
                                        ],
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          );
                        })),
                SizedBox(height: 10),
                Divider(color: textSecondary, thickness: 0.1, height: 0.1),
                textMixer2(
                    "Order Type",
                    homeController.order.value.data!.type.toString(),
                    MainAxisAlignment.spaceBetween),
                textMixer2(
                    "Subtotal",
                    '£${double.parse(homeController.order.value.data!.grandTotal.toString()) + double.parse(homeController.order.value.data!.discount.toString()) - (double.parse(homeController.order.value.data!.deliveryCharge.toString()) + Utils.vatTotal2(homeController.order.value.data!.orderDetails!.data!.toList()) + double.parse(homeController.order.value.data!.serviceCharge.toString()))}',
                    MainAxisAlignment.spaceBetween),
                textMixer2(
                    "Discount",
                    '£' + homeController.order.value.data!.discount.toString(),
                    MainAxisAlignment.spaceBetween),
                textMixer2(
                    "Vat",
                    Utils.vatTotal2(homeController
                            .order.value.data!.orderDetails!.data!
                            .toList())
                        .toString(),
                    MainAxisAlignment.spaceBetween),
                textMixer2(
                    "Service",
                    '£' +
                        homeController.order.value.data!.serviceCharge
                            .toString(),
                    MainAxisAlignment.spaceBetween),
                textMixer2(
                    "Give Amount",
                    homeController.giveAmount.value.toString(),
                    MainAxisAlignment.spaceBetween),
                textMixer2(
                    "Change Amount",
                    (homeController.giveAmount.value -
                            double.parse(
                                homeController.order.value.data!.grandTotal!))
                        .toString(),
                    MainAxisAlignment.spaceBetween),
                textMixer2(
                    "Payment Method", method, MainAxisAlignment.spaceBetween),
                textMixer2(
                    "Delivery Charge",
                    '£' +
                        homeController.order.value.data!.deliveryCharge
                            .toString(),
                    MainAxisAlignment.spaceBetween),
                Divider(color: textSecondary, thickness: 0.1, height: 0.1),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Paid Amount',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSmall,
                        color: primaryText),
                  ),
                ),
                Center(
                  child: Text(
                    '£${double.parse(homeController.order.value.data!.grandTotal.toString()) + double.parse(homeController.order.value.data!.discount.toString()) - (double.parse(homeController.order.value.data!.deliveryCharge.toString()) + Utils.vatTotal2(homeController.order.value.data!.orderDetails!.data!.toList()) + double.parse(homeController.order.value.data!.serviceCharge.toString()))}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSmall,
                        color: primaryText),
                  ),
                ),
                Center(
                  child: Text(
                    'Thanks for ordering with klio',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSmall,
                        color: primaryText),
                  ),
                ),
                SizedBox(height: 10),
              ]))),
      Expanded(
        flex: 1,
        child: MaterialButton(
            elevation: 0,
            color: primaryColor,
            minWidth: 130,
            onPressed: () {
              DefaultPrinter.startPrinting();


            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/print.png',
                  color: white,
                  height: 15,
                  width: 15,
                ),
                SizedBox(width: 5),
                Text("Print",
                    style: TextStyle(color: white, fontSize: fontSmall)),
              ],
            )),
      ),
    ],
  );
}

Widget addMisc(BuildContext context) {
  return Container(
    height: Size.infinite.height,
    width: Size.infinite.width,
    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
    child: ListView(children: [
      textRow1('Name', 'Variant Name'),
      textFieldRow1('Enter menu name', 'Normal'),
      SizedBox(height: 10),
      textRow1('Variant Price', 'Processing Time'),
      textFieldRow1('000.00', 'Enter food processing time'),
      SizedBox(height: 10),
      textRow1('Vat (%)', 'Calorie'),
      textFieldRow1('food vat', '000.00'),
      SizedBox(height: 10),
      textRow1('Image (130x130)', 'Select Menu Meal Period'),
      // textFieldRow1('No file chosen', ''),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                  height: 35,
                  child: MaterialButton(
                      elevation: 0,
                      color: primaryBackground,
                      onPressed: () {},
                      child: Text(
                        'No file chosen',
                        style: TextStyle(
                            color: textSecondary, fontSize: fontSmall),
                      ))
                  // child: normalButton('No file chosen', primaryColor, primaryColor),
                  )),
          SizedBox(width: 8),
          Expanded(
              flex: 1,
              child: SizedBox(
                height: 35,
                child: TextFormField(
                    onChanged: (text) async {},
                    onEditingComplete: () async {},
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: fontVerySmall, color: textSecondary),
                    decoration: InputDecoration(
                        fillColor: secondaryBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        hintStyle: TextStyle(
                            fontSize: fontVerySmall, color: textSecondary))),
              )),
        ],
      ),
      SizedBox(height: 10),
      textRow1('Select Menu Category', 'Select Menu Addons'),
      textFieldRow1('', ''),
      SizedBox(height: 10),
      textRow1('Select Menu Allergies', ''),
      SizedBox(
        height: 35,
        child: TextFormField(
            onChanged: (text) async {},
            onEditingComplete: () async {},
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
            decoration: InputDecoration(
                fillColor: secondaryBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                hintStyle:
                    TextStyle(fontSize: fontVerySmall, color: textSecondary))),
      ),
      textRow1('Menu Description', ''),
      TextFormField(
          onChanged: (text) async {},
          onEditingComplete: () async {},
          keyboardType: TextInputType.text,
          maxLines: 2,
          style: TextStyle(fontSize: fontSmall, color: textSecondary),
          decoration: InputDecoration(
            fillColor: secondaryBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: fontVerySmall,
                color: textSecondary),
          )),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          normalButton('Submit', primaryColor, white, onPressed: () {}),
        ],
      ),
    ]),
  );
}
