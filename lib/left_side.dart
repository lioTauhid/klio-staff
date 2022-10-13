


import 'package:flutter/material.dart';

import 'constant.dart';
import 'custom_widget.dart';

Widget leftSideView(){
  return Drawer(
    width: 400,
    child: Container(
      height: double.infinity,
      color: secondaryBackground,
      padding:
      EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
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
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  iconTextBtn(
                      'assets/dine-in.png',
                      'DINE IN',
                      primaryColor,
                      secondaryBackground,
                      onPressed: () {}),
                  iconTextBtn(
                      'assets/takeway.png',
                      'DINE IN',
                      primaryBackground,
                      primaryText,
                      onPressed: () {}),
                  iconTextBtn(
                      'assets/delivery.png',
                      'DINE IN',
                      primaryBackground,
                      primaryText,
                      onPressed: () {}),
                  iconTextBtn(
                      'assets/table.png',
                      'DINE IN',
                      primaryBackground,
                      primaryText,
                      onPressed: () {}),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, 15, 0, 15),
                child: Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    color: primaryBackground,
                    borderRadius:
                    BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                            height: 26,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: secondaryBackground,
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                            child: DropdownButton<String>(
                              items: <String>[
                                'Item 1',
                                'Item 2',
                                'Item 3',
                              ].map((String value) {
                                return new DropdownMenuItem<
                                    String>(
                                  value: value,
                                  child: new Text(value, style: TextStyle(color: primaryText),),
                                );
                              }).toList(),
                              hint: Text(
                                "Drop Down Item",
                                style:
                                TextStyle(fontSize: 12,color: primaryText),
                              ),
                              borderRadius:
                              BorderRadius.circular(10),
                              underline: SizedBox(),
                              onChanged: (value) {},
                            )),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 26,
                        width: 26,
                        child: MaterialButton(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          color: secondaryBackground,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                6.0),
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
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                6.0),
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
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 12,
                    child: Text('Description',
                        style: TextStyle(fontSize: 10, color: primaryText)),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text('Qty',
                        style: TextStyle(fontSize: 10,color: primaryText)),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text('Rate',
                        style: TextStyle(fontSize: 10,color: primaryText)),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text('Total',
                        style: TextStyle(fontSize: 10,color: primaryText)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('',
                        style: TextStyle(fontSize: 10,color: primaryText)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, 10, 0, 0),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder:
                      (BuildContext context, int index) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 12,
                          child: Text('Chicken Masala',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: primaryText,
                                  fontWeight:
                                  FontWeight.bold)),
                        ),
                        Expanded(
                          flex: 6,
                          child: Row(
                            children: [
                              Text('- 12 +',
                                  style: TextStyle(
                                      color: primaryText,
                                      fontSize: 12)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text('1.5',
                              style: TextStyle(
                                  color: primaryText,
                                  fontSize: 12)),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text('12',
                              style: TextStyle(
                                  color: primaryText,
                                  fontSize: 12)),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons
                                  .delete_forever_outlined,
                              color: alternate,
                              size: 18,
                            ),
                            onPressed: () {
                              print(
                                  'IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, 10, 0, 10),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: primaryBackground,
                    borderRadius:
                    BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(
                        20, 10, 20, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Sub Total',
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: 12),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Service',
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: 12),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Discount',
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: 12),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Due',
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                '£20',
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: 12,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                '£5',
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: 12,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                '£-10',
                                style: TextStyle(
                                    color: primaryText,
                                    fontSize: 12,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                '£15',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: primaryColor,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    iconTextBtnWide(
                        "assets/check.png", 'ORDER',
                        onPressed: () {}),
                    iconTextBtnWide(
                        "assets/credit-card.png", 'Pay',
                        onPressed: () {}),
                    iconTextBtnWide(
                        "assets/print.png", 'Print',
                        onPressed: () {}),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, 10, 0, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    iconTextBtnWide(
                        "assets/percentage.png", 'Discout',
                        onPressed: () {}),
                    iconTextBtnWide(
                        "assets/add.png", 'Add Misc',
                        onPressed: () {}),
                    iconTextBtnWide(
                        "assets/delete.png", 'Delete',
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