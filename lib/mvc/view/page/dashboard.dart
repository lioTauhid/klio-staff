import 'package:flutter/material.dart';
import 'package:klio_staff/constant/color.dart';
import 'package:klio_staff/constant/value.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                topBarMenu(context),
                cardForTopAndOnlineItem(context),
                menuItem(context),
                orderHistoryDataTable(context),
              ],
            ),
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
                    itemTitle: "New Orders",
                    itemSubTitle: "Ordered Items",
                    itemNumber: "0"),
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
                    itemTitle: "Dispatched Orders",
                    itemSubTitle:"Parcel Send",
                    itemNumber:"0"),
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
                    itemTitle:"Canceled Orders",
                    itemSubTitle: "Deleted Orders",
                    itemNumber: "0"),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget menuItem(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 0.5,
        child: Container(
          height: MediaQuery.of(context).size.height*0.15,
          width:MediaQuery.of(context).size.width ,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Menu Items",style: TextStyle(fontSize: fontVeryBig,fontWeight: FontWeight.w900),),
                    Container(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                            fixedSize: const Size(130, 20),
                            foregroundColor: primaryColor,
                            backgroundColor: secondaryAccentColor,
                            shape: const StadiumBorder()),
                        onPressed: (){},
                        label: Text("Add Items",style: TextStyle(fontWeight:FontWeight.bold),),
                        icon: Icon(Icons.add,size: 15,color: primaryColor,),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Flexible(
                      flex: 2,
                      child: ListTile(
                        leading: Image.asset('assets/deliver.png'),
                        title: Text("Chicken Masala"),
                        subtitle: Container(
                          child: Row(
                            children: [
                              Image.asset("assets/edit-alt.png",height: 20,width: 20,),
                              SizedBox(width: 5,),
                              Image.asset("assets/delete.png",height: 20,width: 20,color: red,),
                            ],
                          ),
                        ),
                        trailing: Text("£15.00",style: TextStyle(fontSize: fontMedium,color: accentColor),),
                      ),
                    ),
                  Flexible(
                    flex: 1,
                      child: Container()
                  ),
                  Flexible(
                    flex: 2,
                    child: ListTile(
                      leading: Image.asset('assets/deliver.png'),
                      title: Text("Chicken Masala"),
                      subtitle: Container(
                        child: Row(
                          children: [
                            Image.asset("assets/edit-alt.png",height: 20,width: 20,),
                            SizedBox(width: 5,),
                            Image.asset("assets/delete.png",height: 20,width: 20,color: red,),
                          ],
                        ),
                      ),
                      trailing: Text("£15.00",style: TextStyle(fontSize: fontMedium,color: accentColor),),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container()
                  ),
                  Flexible(
                    flex: 2,
                    child: ListTile(
                      leading: Image.asset('assets/deliver.png'),
                      title: Text("Chicken Masala"),
                      subtitle: Container(
                        child: Row(
                          children: [
                            Image.asset("assets/edit-alt.png",height: 20,width: 20,),
                            SizedBox(width: 5,),
                            Image.asset("assets/delete.png",height: 20,width: 20,color: red,),
                          ],
                        ),
                      ),
                      trailing: Text("£15.00",style: TextStyle(fontSize: fontMedium,color: accentColor),),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      leading: Container(
                            decoration: BoxDecoration(
                              color: accentColor,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                        Text("View All",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                        Icon(Icons.arrow_right_alt,color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                  ),
                  // Container(
                  //     decoration: BoxDecoration(
                  //       color: accentColor,
                  //         borderRadius: BorderRadius.all(Radius.circular(20))
                  //     ),
                  //     child: Row(
                  //          mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: <Widget>[
                  //           Text("View All"),
                  //           Icon(Icons.arrow_right_alt),
                  //         ]
                  //     )
                   ),
                ],
              )
            ],
          ),
        ),
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
                height: MediaQuery.of(context).size.height * 0.3,
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
                            "Top Items",
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
                                        "Name",
                                        style: TextStyle(color: textSecondary),
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text("Ordered",
                                            style:
                                            TextStyle(color: textSecondary))),
                                    DataColumn(
                                        label: Text("Price",
                                            style:
                                            TextStyle(color: textSecondary))),
                                    DataColumn(
                                      label: Text("Total Sold Price",
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
                height: MediaQuery.of(context).size.height * 0.3,
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
                            "Online Orders",
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
  orderHistoryDataTable(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(13),
          child:Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order History",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: fontMedium),
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
                                  fontSize:fontSmall,
                                  color: Colors.blueAccent,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white10,
                                    contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                    prefixIcon: Icon(Icons.search,size: 18,),
                                     hintText: "",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueAccent,),
                                        borderRadius: BorderRadius.circular(10.0)),)),
                          ),
                        ),
                         IconButton(
                             onPressed: (){},
                             icon: Icon(Icons.sort)
                         )
                      ],
                    ),
                  )
                ],
              ),
              Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: Container(
                  width: double.infinity,
                  child: DataTable(
                    dividerThickness:0,
                    columns: [
                      DataColumn(
                        label: Text(
                          "ID",
                          style: TextStyle(color: textSecondary),
                        ),
                      ),
                      DataColumn(
                          label: Text("Time & Date",
                              style:
                              TextStyle(color: textSecondary))),
                      DataColumn(
                          label: Text("Customer Name",
                              style:
                              TextStyle(color: textSecondary))),
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
                      DataColumn(
                        label: Text("Action",
                            style: TextStyle(color: textSecondary)),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Aminur Islam')),
                        DataCell(Text('300')),
                        DataCell(Text('Aminur Islam')),
                        DataCell(Text('300')),
                        DataCell(Text('Aminur Islam')),
                      //  DataCell(Text('New Order',style: TextStyle(color: green),)),
                        DataCell(Container(
                            height: 30, width: 150,
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_to_photos_outlined,size: 15,color: blue,),
                                SizedBox(width: 10,),
                                Text('New Order',style: TextStyle(color: blue),)
                              ],
                            )
                        )),
                        DataCell(
                            Container(
                                height: 30, width: 70,
                                decoration: BoxDecoration(
                                    color: textSecondary,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Icon(Icons.more_horiz)
                            )
                        ),
                      ]),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}