import 'package:flutter/material.dart';

import 'constant.dart';
import 'custom_widget.dart';

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
            Navigator.pop(context);
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

Widget addCustomer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Name*',
        style: TextStyle(fontSize: 18, color: primaryText),
      ),
      SizedBox(height: 10),
      normalTextField(),
      SizedBox(height: 10),
      Text(
        'Email',
        style: TextStyle(fontSize: 18, color: primaryText),
      ),
      SizedBox(height: 10),
      normalTextField(),
      SizedBox(height: 10),
      Text(
        'Phone*',
        style: TextStyle(fontSize: 18, color: primaryText),
      ),
      SizedBox(height: 10),
      normalTextField(),
      SizedBox(height: 10),
      Text(
        'Delivery Address',
        style: TextStyle(fontSize: 18, color: primaryText),
      ),
      SizedBox(height: 10),
      normalTextField(),
      SizedBox(height: 10),
      SizedBox(height: 10),
      Expanded(child: SizedBox(height: Size.infinite.height)),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          normalButton('Submit', primaryColor, white, onPressed: () {}),
        ],
      ),
    ]),
  );
}

Widget foodMenuBody(BuildContext context) {
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
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Size",
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Qty",
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Price",
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text("Chicken Roast",
                style: TextStyle(
                    fontSize: 14,
                    color: primaryText,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 26,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: textSecondary, width: 1)),
                child: DropdownButton<String>(
                  items: <String>[
                    'Full',
                    '2: 2',
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(
                        value,
                        style: TextStyle(color: primaryText),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "   Full   ",
                    style: TextStyle(fontSize: 14, color: primaryText),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  underline: SizedBox(),
                  onChanged: (value) {},
                )),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                topBarIconBtn(
                    'assets/remove.png', primaryColor, white, 0, 2, 14,
                    onPressed: () {}),
                SizedBox(width: 6),
                Text('12', style: TextStyle(color: primaryText, fontSize: 16)),
                SizedBox(width: 6),
                topBarIconBtn('assets/add.png', primaryColor, white, 0, 2, 14,
                    onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text("£1,522",
                style: TextStyle(
                    fontSize: 14,
                    color: primaryText,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      Divider(color: textSecondary, thickness: 1),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Selection",
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "Addon Name",
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Qty",
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Price",
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
          ),
        ],
      ),
      Expanded(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Checkbox(value: true, onChanged: (checked) {}),
                      )),
                  Expanded(
                    flex: 3,
                    child: Text("Chesse",
                        style: TextStyle(
                            fontSize: 15,
                            color: primaryText,
                            fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        topBarIconBtn(
                            'assets/remove.png', primaryColor, white, 0, 2, 14,
                            onPressed: () {}),
                        SizedBox(width: 6),
                        Text('12',
                            style: TextStyle(
                                color: primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 6),
                        topBarIconBtn(
                            'assets/add.png', primaryColor, white, 0, 2, 14,
                            onPressed: () {}),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("£15",
                        style: TextStyle(
                            fontSize: 15,
                            color: primaryText,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              );
            }),
      ),
      MaterialButton(
          elevation: 0,
          color: primaryColor,
          height: 40,
          minWidth: 160,
          // padding: EdgeInsets.all(20),
          onPressed: () {},
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
              Text("Add to cart", style: TextStyle(color: white, fontSize: 14)),
            ],
          )),
    ]),
  );
}

Widget tableBody(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Expanded(
        child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size.width > size.height ? 3 : 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            scrollDirection: Axis.vertical,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                // width: 40,
                // height: 50,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: textSecondary, width: 1)),
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
                              'Table NO : 02',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: primaryText),
                            ),
                            Text('Sit capacity: 5 Available: 1',
                                style: TextStyle(
                                    fontSize: 10, color: primaryText)),
                          ],
                        ),
                        Image.asset(
                          "assets/table.png",
                          height: 55,
                          width: 55,
                          fit: BoxFit.fill,
                          color: primaryColor,
                        )
                      ],
                    ),
                    Divider(color: textSecondary, thickness: 1),
                    SizedBox(height: 15),
                    Text("Running Order In Table",
                        style: TextStyle(
                            fontSize: 15,
                            color: primaryText,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              'Order',
                              style:
                                  TextStyle(color: textSecondary, fontSize: 12),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              'Time',
                              style:
                                  TextStyle(color: textSecondary, fontSize: 12),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              'Person',
                              style:
                                  TextStyle(color: textSecondary, fontSize: 12),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              '',
                              style:
                                  TextStyle(color: textSecondary, fontSize: 12),
                            )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('#A002',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: primaryText,
                                                fontWeight: FontWeight.bold))),
                                    Expanded(
                                        flex: 1,
                                        child: Text('7:30AM\n2/5/2022',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: primaryText,
                                                fontWeight: FontWeight.bold))),
                                    Expanded(
                                      flex: 1,
                                      child: Text('2',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: primaryText,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            "assets/delete.png",
                                            color: Colors.red,
                                          ),
                                        )),
                                  ],
                                ),
                                Divider(color: textSecondary, thickness: 1),
                              ],
                            );
                          }),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 35,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: TextFormField(
                                onChanged: (text) async {},
                                onEditingComplete: () async {},
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: primaryText),
                                decoration: InputDecoration(
                                    fillColor: secondaryBackground,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        color: primaryText),
                                    hintText: 'Person')),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: MaterialButton(
                                elevation: 0,
                                color: primaryColor,
                                height: 45,
                                // minWidth: 180,
                                // padding: EdgeInsets.all(20),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: white, fontSize: 14),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      Divider(color: textSecondary, thickness: 1),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          normalButton('Please read', primaryBackground, primaryText,
              onPressed: () {}),
          normalButton(
              'Process without table', primaryBackground, textSecondary,
              onPressed: () {}),
          normalButton('Submit', primaryColor, white, onPressed: () {}),
        ],
      ),
    ]),
  );
}

Widget orderDetail(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 1,
              child: textMixer(
                  'Order Type: ', 'Dine In', MainAxisAlignment.start)),
          Expanded(
              flex: 1,
              child: textMixer(
                  'Customer Name: ', 'Aminul', MainAxisAlignment.start)),
          Expanded(
              flex: 1,
              child:
                  textMixer('Invoice', 'KL009832', MainAxisAlignment.center)),
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
                  'Table Number: ', 'Dine In', MainAxisAlignment.start)),
          Expanded(
              flex: 1,
              child: textMixer(
                  'Processing Time: ', 'Aminul', MainAxisAlignment.start)),
          Expanded(
              flex: 1,
              child: textMixer('Price', 'KL009832', MainAxisAlignment.center)),
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
              style: TextStyle(fontSize: 10, color: primaryText, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Name",
              style: TextStyle(fontSize: 10, color: primaryText, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Variant Name",
              style: TextStyle(fontSize: 10, color: primaryText, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Price",
              style: TextStyle(fontSize: 10, color: primaryText, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Qty",
              style: TextStyle(fontSize: 10, color: primaryText, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Vat",
              style: TextStyle(fontSize: 10, color: primaryText, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Total",
              style: TextStyle(fontSize: 10, color: primaryText, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      // Expanded(
      //   child: ListView.builder(
      //       itemCount: 5,
      //       itemBuilder: (BuildContext context, int index) {
      //         return Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Expanded(
      //                 flex: 1,
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(right: 60.0),
      //                   child: Checkbox(
      //                       value: true,
      //                       onChanged: (checked) {}),
      //                 )),
      //             Expanded(
      //               flex: 3,
      //               child: Text("Chesse",
      //                   style: TextStyle(
      //                       fontSize: 15,
      //                       color: primaryText,
      //                       fontWeight: FontWeight.bold)),
      //             ),
      //             Expanded(
      //               flex: 2,
      //               child: Row(
      //                 children: [
      //                   topBarIconBtn(
      //                       'assets/remove.png', primaryColor, white, 0, 2, 14,
      //                       onPressed: () {}),
      //                   SizedBox(width: 6),
      //                   Text('12',
      //                       style: TextStyle(
      //                           color: primaryText,
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.bold)),
      //                   SizedBox(width: 6),
      //                   topBarIconBtn(
      //                       'assets/add.png', primaryColor, white, 0, 2, 14,
      //                       onPressed: () {}),
      //                 ],
      //               ),
      //             ),
      //             Expanded(
      //               flex: 1,
      //               child: Text("£15",
      //                   style: TextStyle(
      //                       fontSize: 15,
      //                       color: primaryText,
      //                       fontWeight: FontWeight.bold)),
      //             ),
      //           ],
      //         );
      //       }),
      // ),
    ]),
  );
}
