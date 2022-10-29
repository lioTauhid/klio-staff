import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klio_staff/mvc/model/addons.dart';
import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../../controller/home_controller.dart';
import '../widget/custom_widget.dart';

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

Widget addCustomer(BuildContext context, {Function()? onPressed}) {
  HomeController homeController = Get.find();
  return Container(
    height: Size.infinite.height,
    width: Size.infinite.width,
    padding: EdgeInsets.all(30),
    child: ListView( children: [
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

Widget foodMenuBody(BuildContext context, Data data) {
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
      Row(
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
                    style: TextStyle(fontSize: fontMedium, color: primaryText),
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
                topBarIconBtn(Image.asset('assets/remove.png', color: white),
                    primaryColor, 0, 2, 14,
                    onPressed: () {}),
                SizedBox(width: 6),
                Text('0',
                    style: TextStyle(color: primaryText, fontSize: fontMedium)),
                SizedBox(width: 6),
                topBarIconBtn(Image.asset('assets/add.png', color: white),
                    primaryColor, 0, 2, 14,
                    onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text("£${data.price}",
                style: TextStyle(
                    fontSize: fontMedium,
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
      Expanded(
        child: ListView.builder(
            itemCount: data.addons!.data!.length,
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
                    child: Text(data.addons!.data![index].name.toString(),
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
                            14,
                            onPressed: () {}),
                        SizedBox(width: 6),
                        Text('0',
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
                            14,
                            onPressed: () {}),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("£${data.addons!.data![index].price.toString()}",
                        style: TextStyle(
                            fontSize: fontSmall,
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
              Text("Add to cart",
                  style: TextStyle(color: white, fontSize: fontSmall)),
            ],
          )),
    ]),
  );
}

Widget tableBody(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  ScrollController _scrollController= ScrollController();;
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
          child: GridView.builder(
              padding: EdgeInsets.zero,
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: size.width > size.height ? 3 : 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: .7,
              ),
              scrollDirection: Axis.vertical,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // width: 40,
                  // height: 50,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(30.0),
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
                                'Table NO : 02',
                                style: TextStyle(
                                    fontSize: fontBig,
                                    fontWeight: FontWeight.bold,
                                    color: primaryText),
                              ),
                              Text('Sit capacity: 5 Available: 1',
                                  style: TextStyle(
                                      fontSize: fontVerySmall,
                                      color: primaryText)),
                            ],
                          ),
                          Image.asset(
                            "assets/table2.png",
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
                            border: Border.all(color: textSecondary, width: .3)),
                      ),
                      SizedBox(height: 15),
                      Text("Running Order In Table",
                          style: TextStyle(
                              fontSize: fontSmall,
                              color: primaryText,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(
                                'Order',
                                style: TextStyle(
                                    color: textSecondary,
                                    fontSize: fontVerySmall),
                              )),
                          Expanded(
                              flex: 3,
                              child: Text(
                                'Time',
                                style: TextStyle(
                                    color: textSecondary,
                                    fontSize: fontVerySmall),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                'Person',
                                style: TextStyle(
                                    color: textSecondary,
                                    fontSize: fontVerySmall),
                              )),
                          Expanded(
                              flex: 1,
                              child: Text(
                                '',
                                style: TextStyle(
                                    color: textSecondary,
                                    fontSize: fontVerySmall),
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
                                          flex: 2,
                                          child: Text('#A002',
                                              style: TextStyle(
                                                  fontSize: fontSmall,
                                                  color: primaryText,
                                                  fontWeight: FontWeight.bold))),
                                      Expanded(
                                          flex: 3,
                                          child: Text('7:30AM\n2/5/2022',
                                              style: TextStyle(
                                                  fontSize: fontSmall,
                                                  color: primaryText,
                                                  fontWeight: FontWeight.bold))),
                                      Expanded(
                                        flex: 2,
                                        child: Text('2',
                                            style: TextStyle(
                                                fontSize: fontSmall,
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
                                              height: 18,
                                              width: 18,
                                            ),
                                          )),
                                    ],
                                  ),
                                  Container(
                                    height: .5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: textSecondary, width: .3)),
                                  ),
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
                                      fontSize: fontVerySmall,
                                      color: primaryText),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                            color: textSecondary, width: .5),
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      hintStyle: TextStyle(
                                          fontSize: fontVerySmall,
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
                                    style: TextStyle(
                                        color: white, fontSize: fontVerySmall),
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
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          normalButton(
              'Process without table', Colors.transparent, textSecondary,
              onPressed: () {}),
          normalButton('Please read', primaryBackground, primaryText,
              onPressed: () {}),
          SizedBox(width: 100),
          normalButton('Submit', primaryColor, white,
              onPressed: () {}),
        ],
      ),
    ]),
  );
}

Widget orderDetail(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  textMixer('Invoice: ', 'KL009832', MainAxisAlignment.center)),
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
              child:
                  textMixer('Price: ', 'KL009832', MainAxisAlignment.center)),
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
      Divider(color: textSecondary, thickness: 1),
      SizedBox(
          height: 80,
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
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
                            "Mega Food2",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "1:1",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "£15",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "5.00%",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "£15.5",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: textSecondary, thickness: 1),
                  ],
                );
              })),
      Text(
        'Addons:',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: fontBig, color: primaryText),
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
      Divider(color: textSecondary, thickness: 1),
      SizedBox(
          height: 60,
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
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
                            "Mega Food2",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "£15",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "5.00%",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "£15.5",
                            style: TextStyle(
                                fontSize: fontVerySmall,
                                color: textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: textSecondary, thickness: 1),
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
                  'Order Type: ', 'Dine In', MainAxisAlignment.start)),
          Expanded(
              flex: 1,
              child: textMixer(
                  'Customer Name: ', 'Aminul', MainAxisAlignment.start)),
          Expanded(
              flex: 1,
              child:
                  textMixer('Invoice: ', 'KL009832', MainAxisAlignment.center)),
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
              child:
                  textMixer('Price: ', 'KL009832', MainAxisAlignment.center)),
        ],
      ),
      SizedBox(height: 20),
      Center(
        child: Text(
          'Total Payable: £120.5',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSmall,
              color: textSecondary),
        ),
      ),
      Expanded(child: SizedBox(height: 500)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          normalButton('Create Invoice', primaryColor, white,
              onPressed: () {}),
          normalButton('Close', textSecondary, white,
              onPressed: () {}),
        ],
      )
    ]),
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
                    onPressed: (){},
                    child: Text(
                      'No file chosen',
                      style: TextStyle(color: textSecondary, fontSize: fontSmall),
                    ))
                // child: normalButton('No file chosen', primaryColor, primaryColor),
              )
          ),
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
                        fontSize: fontVerySmall,
                        color: textSecondary),
                    decoration: InputDecoration(
                        fillColor: secondaryBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        hintStyle: TextStyle(
                            fontSize: fontVerySmall,
                            color: textSecondary))),
              )
          ),
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
            style: TextStyle(
                fontSize: fontVerySmall,
                color: textSecondary),
            decoration: InputDecoration(
                fillColor: secondaryBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                hintStyle: TextStyle(
                    fontSize: fontVerySmall,
                    color: textSecondary))),
      ),
      textRow1('Menu Description', ''),
      TextFormField(
          onChanged: (text) async {},
          onEditingComplete: () async {},
          keyboardType: TextInputType.text,
          maxLines: 2,
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: fontSmall, color: textSecondary),
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
