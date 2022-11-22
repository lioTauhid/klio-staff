import 'dart:html';

import 'package:flutter/material.dart';
import 'package:klio_staff/constant/color.dart';
import 'package:klio_staff/constant/value.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  final String new_order = "New Orders";
  final String order_item = "Ordered Items";
  final String dispatched_order = "Dispatched Orders";
  final String parcel_send = "Parcel Send";
  final String cancel_order = "Canceled Orders";
  final String delete_order = "Deleted Orders";
  final String number_of_item = "0";

  //  user for top  item
  final String top_item = "Top Items";
  final String top_item_name = "Name";
  final String top_item_ordered = "Ordered";
  final String top_item_price = "Price";
  final String top_item_total_sold = "Total Sold Price";

  //use for online item

  final String online_order = "Online Orders";
  final String online_order_id_time = "ID & Time";
  final String online_order_userName = "User Name";
  final String online_orderStatus = "Status";

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            children: [
              topBarMenu(context),
              cardForTopAndOnlineItem(context),
            ],
          ),
    );
  }

  Widget topBarMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: cardSingleItem(
                    image: "assets/new_order.png",
                    itemTitle: new_order,
                    itemSubTitle: order_item,
                    itemNumber: number_of_item),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: cardSingleItem(
                    image: "assets/dispatched_order.png",
                    itemTitle: dispatched_order,
                    itemSubTitle: parcel_send,
                    itemNumber: number_of_item),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: cardSingleItem(
                    image: "assets/cancel_order.png",
                    itemTitle: cancel_order,
                    itemSubTitle: delete_order,
                    itemNumber: number_of_item),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardSingleItem(
      {String? image,
        String? itemTitle,
        String? itemSubTitle,
        String? itemNumber}) {
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
          child: Builder(builder: (BuildContext context) {
            if (itemTitle == "New Orders") {
              return Center(
                  child: Text(itemNumber!,
                      style: TextStyle(
                          color: blue,
                          fontSize: fontBig,
                          fontWeight: FontWeight.bold)));
            } else if (itemTitle == "Dispatched Orders") {
              return Center(
                  child: Text(itemNumber!,
                      style: TextStyle(
                          color: green,
                          fontSize: fontBig,
                          fontWeight: FontWeight.bold)));
            } else if (itemTitle == "Canceled Orders") {
              return Center(
                  child: Text(itemNumber!,
                      style: TextStyle(
                          color: red,
                          fontSize: fontBig,
                          fontWeight: FontWeight.bold)));
            } else
              return Text("");
          }),
          // child: Center(child: Text(itemNumber!,style: TextStyle(color:blue,fontSize: fontBig)))
        ),
      ],
    );
  }

  Widget cardForTopAndOnlineItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: Text(
                            top_item,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
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
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        top_item_name,
                                        style: TextStyle(color: textSecondary),
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text(top_item_ordered,
                                            style:
                                            TextStyle(color: textSecondary))),
                                    DataColumn(
                                        label: Text(top_item_price,
                                            style:
                                            TextStyle(color: textSecondary))),
                                    DataColumn(
                                      label: Text(top_item_total_sold,
                                          style: TextStyle(color: textSecondary)),
                                    ),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text('Pasta')),
                                      DataCell(Text('300')),
                                      DataCell(Text('£12.5')),
                                      DataCell(Container(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("£3,750"),
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
                                    DataRow(cells: [
                                      DataCell(Text('Chicken Masala')),
                                      DataCell(Text('269')),
                                      DataCell(Text('£11')),
                                      DataCell(Container(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("£2,959"),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.arrow_downward,
                                                size: 15,
                                                color: red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ])
                                  ],
                                )))
                      ],
                    ),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: Text(
                            online_order,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
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
                                child: Theme(
                                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                  child: DataTable(
                                    dividerThickness:0,
                                    columns: [
                                      DataColumn(
                                        label: Text(
                                          online_order_id_time,
                                          style: TextStyle(color: textSecondary),
                                        ),
                                      ),
                                      DataColumn(
                                          label: Text(online_order_userName,
                                              style:
                                              TextStyle(color: textSecondary))),
                                      DataColumn(
                                          label: Text(online_order,
                                              style:
                                              TextStyle(color: textSecondary))),
                                      DataColumn(
                                        label: Text(online_orderStatus,
                                            style: TextStyle(color: textSecondary)),
                                      ),
                                    ],
                                    rows: [
                                      DataRow(cells: [
                                        DataCell(Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 3,),
                                              Text("#A0223",style: TextStyle(
                                                  color: primaryText,
                                                  fontSize: fontSmall),),
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
                                        DataCell(Text('300')),
                                        DataCell(Text('Aminur Islam')),
                                        DataCell(Text('New Order',style: TextStyle(color: green),)),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 3,),
                                              Text("#A0223",style: TextStyle(
                                                  color: primaryText,
                                                  fontSize: fontSmall),),
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
                                        DataCell(Text('300')),
                                        DataCell(Text('Aminur Islam')),
                                        DataCell(Text('pending',style: TextStyle(color: red),)),
                                      ])
                                    ],
                                  ),
                                )))
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}