import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klio_staff/constant/color.dart';
import 'package:klio_staff/constant/value.dart';

import '../../controller/home_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            topBarMenu(context),
            cardForTopAndOnlineItem(context),
            midBarMenu(context),
            // menuItem(context),
            orderHistoryDataTable(context),
          ],
        ),
      ),
    );
  }

  Widget topBarMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                child: Card(
                  elevation: 10,
                  color: secondaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: cardSingleItem(
                    image: "assets/new_order.png",
                    itemTitle: "New Orders",
                    itemSubTitle: "Ordered Items",
                    color: blue,
                    itemNumber: homeController
                        .dashData.value.data!.pendingOrders
                        .toString(),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.015,
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                child: Card(
                  elevation: 10,
                  color: secondaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: cardSingleItem(
                      image: "assets/dispatched_order.png",
                      itemTitle: "Successful Orders",
                      itemSubTitle: "Parcel Send",
                      color: green,
                      itemNumber: homeController
                          .dashData.value.data!.successOrders
                          .toString()),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.015,
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                child: Card(
                  elevation: 10,
                  color: secondaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: cardSingleItem(
                      image: "assets/cancel_order.png",
                      itemTitle: "Canceled Orders",
                      itemSubTitle: "Deleted Orders",
                      color: red,
                      itemNumber: homeController
                          .dashData.value.data!.cancelOrders
                          .toString()),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget midBarMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                child: Card(
                    elevation: 10,
                    color: secondaryBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: cardSingleItem(
                      image: "assets/dispatched_order.png",
                      itemTitle: "Weekly Orders",
                      itemSubTitle: "Weekly total orders",
                      color: green,
                      itemNumber: homeController
                          .dashData.value.data!.weeklyOrders
                          .toString(),
                    )),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.015,
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                child: Card(
                  elevation: 10,
                  color: secondaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: cardSingleItem(
                      image: "assets/dispatched_order.png",
                      itemTitle: "Monthly Orders",
                      itemSubTitle: "Monthly total orders",
                      color: green,
                      itemNumber: homeController
                          .dashData.value.data!.monthlyOrders
                          .toString()),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.015,
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                child: Card(
                  elevation: 10,
                  color: secondaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: cardSingleItem(
                      image: "assets/dispatched_order.png",
                      itemTitle: "Yearly Orders",
                      itemSubTitle: "Yearly total orders",
                      color: green,
                      itemNumber: homeController
                          .dashData.value.data!.yearlyOrders
                          .toString()),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // Widget menuItem(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(15.0),
  //     child: Card(
  //       elevation: 0.5,
  //       color: secondaryBackground,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       child: Container(
  //         height: MediaQuery.of(context).size.height * 0.2,
  //         width: MediaQuery.of(context).size.width,
  //         child: Column(
  //           children: [
  //             Padding(
  //               padding: EdgeInsets.only(top: 10, left: 10, right: 10),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     "Menu Items",
  //                     style: TextStyle(
  //                         fontSize: fontVeryBig,
  //                         fontWeight: FontWeight.w900,
  //                         color: primaryText),
  //                   ),
  //                   Container(
  //                     child: TextButton.icon(
  //                       style: TextButton.styleFrom(
  //                           fixedSize: const Size(130, 20),
  //                           foregroundColor: primaryColor,
  //                           backgroundColor: secondaryAccentColor,
  //                           shape: const StadiumBorder()),
  //                       onPressed: () {},
  //                       label: Text(
  //                         "Add Items",
  //                         style: TextStyle(fontWeight: FontWeight.bold),
  //                       ),
  //                       icon: Icon(
  //                         Icons.add,
  //                         size: 15,
  //                         color: primaryColor,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Flexible(
  //                   flex: 2,
  //                   child: ListTile(
  //                     leading: Image.asset('assets/deliver.png'),
  //                     title: Text(
  //                       "Chicken Masala",
  //                       style: TextStyle(color: primaryText),
  //                     ),
  //                     subtitle: Container(
  //                       child: Row(
  //                         children: [
  //                           Image.asset(
  //                             "assets/edit-alt.png",
  //                             height: 20,
  //                             width: 20,
  //                             color: primaryText,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           Image.asset(
  //                             "assets/delete.png",
  //                             height: 20,
  //                             width: 20,
  //                             color: red,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     trailing: Text(
  //                       "£15.00",
  //                       style:
  //                           TextStyle(fontSize: fontMedium, color: accentColor),
  //                     ),
  //                   ),
  //                 ),
  //                 Flexible(flex: 1, child: Container()),
  //                 Flexible(
  //                   flex: 2,
  //                   child: ListTile(
  //                     leading: Image.asset('assets/deliver.png'),
  //                     title: Text(
  //                       "Chicken Masala",
  //                       style: TextStyle(color: primaryText),
  //                     ),
  //                     subtitle: Container(
  //                       child: Row(
  //                         children: [
  //                           Image.asset(
  //                             "assets/edit-alt.png",
  //                             height: 20,
  //                             width: 20,
  //                             color: primaryText,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           Image.asset(
  //                             "assets/delete.png",
  //                             height: 20,
  //                             width: 20,
  //                             color: red,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     trailing: Text(
  //                       "£15.00",
  //                       style:
  //                           TextStyle(fontSize: fontMedium, color: accentColor),
  //                     ),
  //                   ),
  //                 ),
  //                 Flexible(flex: 1, child: Container()),
  //                 Flexible(
  //                   flex: 2,
  //                   child: ListTile(
  //                     leading: Image.asset('assets/deliver.png'),
  //                     title: Text(
  //                       "Chicken Masala",
  //                       style: TextStyle(color: primaryText),
  //                     ),
  //                     subtitle: Container(
  //                       child: Row(
  //                         children: [
  //                           Image.asset(
  //                             "assets/edit-alt.png",
  //                             height: 20,
  //                             width: 20,
  //                             color: primaryText,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           Image.asset(
  //                             "assets/delete.png",
  //                             height: 20,
  //                             width: 20,
  //                             color: red,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     trailing: Text(
  //                       "£15.00",
  //                       style:
  //                           TextStyle(fontSize: fontMedium, color: accentColor),
  //                     ),
  //                   ),
  //                 ),
  //                 Flexible(
  //                   flex: 1,
  //                   child: ListTile(
  //                     leading: Container(
  //                       decoration: BoxDecoration(
  //                           color: accentColor,
  //                           borderRadius:
  //                               BorderRadius.all(Radius.circular(20))),
  //                       child: Padding(
  //                         padding: const EdgeInsets.symmetric(horizontal: 10),
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: [
  //                             Text(
  //                               "View All",
  //                               textAlign: TextAlign.center,
  //                               style: TextStyle(color: Colors.white),
  //                             ),
  //                             Icon(Icons.arrow_right_alt, color: Colors.white),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   // Container(
  //                   //     decoration: BoxDecoration(
  //                   //       color: accentColor,
  //                   //         borderRadius: BorderRadius.all(Radius.circular(20))
  //                   //     ),
  //                   //     child: Row(
  //                   //          mainAxisAlignment: MainAxisAlignment.center,
  //                   //         crossAxisAlignment: CrossAxisAlignment.center,
  //                   //         children: <Widget>[
  //                   //           Text("View All"),
  //                   //           Icon(Icons.arrow_right_alt),
  //                   //         ]
  //                   //     )
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget cardSingleItem(
      {String? image,
      String? itemTitle,
      String? itemSubTitle,
      String? itemNumber,
      Color? color}) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Image.asset(image!),
            )),
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    itemTitle!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: primaryText),
                  ),
                  Text(
                    itemSubTitle!,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: textSecondary),
                  ),
                ],
              ),
            )),
        Expanded(
            flex: 1,
            child: Center(
                child: Text(itemNumber!,
                    style: TextStyle(
                        color: color,
                        fontSize: fontBig,
                        fontWeight: FontWeight.bold)))),
      ],
    );
  }

  Widget cardForTopAndOnlineItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Card(
                  elevation: 0.0,
                  color: secondaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          "Top Items",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: primaryText,
                              fontSize: fontMedium),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Obx(() {
                                return SingleChildScrollView(
                                  child: DataTable(
                                    dividerThickness: 2,
                                    columns: [
                                      DataColumn(
                                        label: Text(
                                          "Name",
                                          style:
                                              TextStyle(color: textSecondary),
                                        ),
                                      ),
                                      DataColumn(
                                          label: Text("Ordered",
                                              style: TextStyle(
                                                  color: textSecondary))),
                                      DataColumn(
                                          label: Text("Price",
                                              style: TextStyle(
                                                  color: textSecondary))),
                                      DataColumn(
                                        label: Text("Total Sold Price",
                                            style: TextStyle(
                                                color: textSecondary)),
                                      ),
                                    ],
                                    rows: [
                                      for (var item in homeController
                                          .dashData.value.data!.topItems!.data!)
                                        DataRow(cells: [
                                          DataCell(Text(
                                            item.name.toString(),
                                            style:
                                                TextStyle(color: primaryText),
                                          )),
                                          DataCell(Text(
                                              item.totalOrdered.toString(),
                                              style: TextStyle(
                                                  color: primaryText))),
                                          DataCell(Text(item.price.toString(),
                                              style: TextStyle(
                                                  color: primaryText))),
                                          DataCell(Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    item.totalSoldPrice
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: primaryText)),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.arrow_upward,
                                                    size: 15,
                                                    color: green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                        ]),
                                    ],
                                  ),
                                );
                              })))
                    ],
                  ),
                ),
              )),
          SizedBox(
            width: 30,
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Card(
                  elevation: 0.0,
                  color: secondaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          "Online Orders",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: primaryText,
                              fontSize: fontMedium),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: DataTable(
                                dividerThickness: 2,
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      "ID & Time",
                                      style: TextStyle(color: textSecondary),
                                    ),
                                  ),
                                  DataColumn(
                                      label: Text("User Name",
                                          style:
                                              TextStyle(color: textSecondary))),
                                  DataColumn(
                                      label: Text("Online Orders",
                                          style:
                                              TextStyle(color: textSecondary))),
                                  DataColumn(
                                    label: Text("Status",
                                        style: TextStyle(color: textSecondary)),
                                  ),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "#A0223",
                                            style: TextStyle(
                                                color: primaryText,
                                                fontSize: fontSmall),
                                          ),
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              "12:20am|22/07/2022",
                                              style: TextStyle(
                                                  color: textSecondary,
                                                  fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                    DataCell(Text(
                                      '300',
                                      style: TextStyle(color: primaryText),
                                    )),
                                    DataCell(Text('Aminur Islam',
                                        style: TextStyle(color: primaryText))),
                                    DataCell(Text(
                                      'New Order',
                                      style: TextStyle(color: green),
                                    )),
                                  ]),
                                ],
                              )))
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget orderHistoryDataTable(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Card(
        elevation: 0.5,
        color: secondaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order History",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: fontMedium,
                        color: primaryText),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 250,
                            height: 30,
                            child: TextField(
                                style: TextStyle(
                                  fontSize: fontSmall,
                                  color: Colors.blueAccent,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white10,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 18,
                                  ),
                                  hintText: "",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                )),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.sort,
                              color: textSecondary,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                child: Obx(() {
                  return DataTable(
                    dividerThickness: 2,
                    columns: [
                      DataColumn(
                        label: Text(
                          "Invoice",
                          style: TextStyle(color: textSecondary),
                        ),
                      ),
                      DataColumn(
                          label: Text("Time & Date",
                              style: TextStyle(color: textSecondary))),
                      DataColumn(
                          label: Text("Customer Name",
                              style: TextStyle(color: textSecondary))),
                      DataColumn(
                        label: Text("Location",
                            style: TextStyle(color: textSecondary)),
                      ),
                      DataColumn(
                        label: Text("Amount",
                            style: TextStyle(color: textSecondary)),
                      ),
                      DataColumn(
                        label: Text("Status Order",
                            style: TextStyle(color: textSecondary)),
                      ),
                    ],
                    rows: [
                      for (var item in homeController
                          .dashData.value.data!.orderHistory!.data!)
                        DataRow(cells: [
                          DataCell(Text(
                            item.invoice.toString(),
                            style: TextStyle(color: primaryText),
                          )),
                          DataCell(Text(item.date.toString(),
                              style: TextStyle(color: primaryText))),
                          DataCell(Text(item.customerName.toString(),
                              style: TextStyle(color: primaryText))),
                          DataCell(Text('None',
                              style: TextStyle(color: primaryText))),
                          DataCell(Text(item.grandTotal.toString(),
                              style: TextStyle(color: primaryText))),
                          DataCell(Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: item.status == 'cancel'
                                      ? red
                                      : item.status == 'served'
                                          ? green
                                          : blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Icon(
                                  //   Icons.add_to_photos_outlined,
                                  //   size: 15,
                                  //   color: primaryText,
                                  // ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Text(
                                    item.status.toString(),
                                    style: TextStyle(color: white),
                                  )
                                ],
                              ))),
                        ]),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
