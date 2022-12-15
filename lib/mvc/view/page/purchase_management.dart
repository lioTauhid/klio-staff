
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:klio_staff/constant/color.dart';
import 'package:klio_staff/constant/value.dart';
import 'package:klio_staff/mvc/controller/purchase_management_controller.dart';
import 'package:klio_staff/mvc/model/purchase_list_model.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class PurchaseManagement extends StatefulWidget {
  const PurchaseManagement({Key? key}) : super(key: key);

  @override
  State<PurchaseManagement> createState() => _PurchaseManagementState();
}

class _PurchaseManagementState extends State<PurchaseManagement>with SingleTickerProviderStateMixin {
  PurchaseManagementController purchaseCtrl = Get.put(PurchaseManagementController());
  int _currentSelection = 0;
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(vsync: this, length: 3);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              itemTitleHeader(),
              customTapbarHeader(controller),
              Expanded(
                child: TabBarView(controller: controller, children: [
                              purchaseDataTable(),
                              expenseDataTable(),
                              expenseCategoryDataTable(),
                ]),
              )
            ],
          ),
        )
    );
  }

  Widget purchaseDataTable() {
    return Card(
      color: secondaryBackground,
      child: SingleChildScrollView(
        child: GetBuilder<PurchaseManagementController>(
          builder: (controller) {
            return DataTable(
                dataRowHeight: 70,
                columns: [
                  // column to set the name
                  DataColumn(label: Text('SL NO',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Reference No',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Date',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Supplier',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Grand Total',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Due Amount',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Action',style: TextStyle(color:textSecondary),),),
                ],

                rows: controller.purchaseData.value.data.reversed
                    .map(
                      (item) => DataRow(
                    cells: [
                      DataCell(
                        Text('${item.id ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.referenceNo ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.date ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.supplier.name ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.totalAmount ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.paidAmount ?? ""}'),
                      ),
                      DataCell(
                        Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffE1FDE8),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image.asset(
                                "assets/hide.png",
                                height: 15,
                                width: 15,
                                color: Color(0xff00A600),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffFEF4E1),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image.asset(
                                "assets/edit-alt.png",
                                height: 15,
                                width: 15,
                                color: Color(0xffED7402),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffFFE7E6),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image.asset(
                                "assets/delete.png",
                                height: 15,
                                width: 15,
                                color: Color(0xffED0206),
                              ),
                            ),
                          ],
                        ),)
                    ],
                  ),
                )
                    .toList());
          }
        ),
      ),
    );
  }
  Widget expenseDataTable() {
    return Card(
      color: secondaryBackground,
      child: SingleChildScrollView(
        child: GetBuilder<PurchaseManagementController>(
          builder: (controller) {
            return DataTable(
               // dataRowHeight: 70,
                columnSpacing: 50,
                columns: [
                  // column to set the name
                  DataColumn(label: Text('SL NO',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Category',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Responsible Person',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Amount',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Date',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Note',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Status',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Action',style: TextStyle(color:textSecondary),),),
                ],

                rows: controller.expenseData.value.data.reversed
                    .map(
                      (item) => DataRow(
                    cells: [
                      DataCell(
                        Text('${item.id ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.category.name ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.person.name ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.amount ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.date ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.note ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.status ?? ""}'),
                      ),
                      DataCell(
                        Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffE1FDE8),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image.asset(
                                "assets/hide.png",
                                height: 15,
                                width: 15,
                                color: Color(0xff00A600),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffFEF4E1),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image.asset(
                                "assets/edit-alt.png",
                                height: 15,
                                width: 15,
                                color: Color(0xffED7402),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffFFE7E6),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image.asset(
                                "assets/delete.png",
                                height: 15,
                                width: 15,
                                color: Color(0xffED0206),
                              ),
                            ),
                          ],
                        ),)
                    ],
                  ),
                )
                    .toList());
          }
        ),
      ),
    );
  }
  Widget expenseCategoryDataTable() {
    return Card(
      color: secondaryBackground,
      child: SingleChildScrollView(
        child: GetBuilder<PurchaseManagementController>(
          builder: (controller) {
            return DataTable(
                dataRowHeight: 70,
                columnSpacing: 50,
                columns: [
                  // column to set the name
                  DataColumn(label: Text('SL NO',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Name',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Status',style: TextStyle(color:textSecondary),),),
                  DataColumn(label: Text('Action',style: TextStyle(color:textSecondary),),),
                ],

                rows: controller.expenseCategoryData.value.data.reversed
                    .map(
                      (item) => DataRow(
                    cells: [
                      DataCell(
                        Text('${item.id ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.name ?? ""}'),
                      ),
                      DataCell(
                        Text('${item.status ?? ""}'),
                      ),
                      DataCell(
                        Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffE1FDE8),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image.asset(
                                "assets/hide.png",
                                height: 15,
                                width: 15,
                                color: Color(0xff00A600),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffFEF4E1),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image.asset(
                                "assets/edit-alt.png",
                                height: 15,
                                width: 15,
                                color: Color(0xffED7402),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffFFE7E6),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image.asset(
                                "assets/delete.png",
                                height: 15,
                                width: 15,
                                color: Color(0xffED0206),
                              ),
                            ),
                          ],
                        ),)
                    ],
                  ),
                )
                    .toList());
          }
        ),
      ),
    );
  }

  itemTitleHeader() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Purchase List',
              style: TextStyle(fontSize: fontBig, color: primaryText),
            ),
          ),
          Container(
            child: Row(
              children: [
                OutlinedButton.icon(
                  icon: Icon(
                    Icons.add,
                    color: primaryText,
                  ),
                  label: Text(
                    "Add New Purchase",
                    style: TextStyle(
                      color: primaryText,
                    ),
                  ),
                  onPressed: () => print("it's pressed"),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                OutlinedButton.icon(
                  icon: Icon(
                    Icons.cloud_upload_outlined,
                    color: white,
                  ),
                  label: Text(
                    "Upload Menu",
                    style: TextStyle(color: white),
                  ),
                  onPressed: () => print("it's pressed"),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    side: BorderSide(width: 2.0, color: Colors.transparent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customTapbarHeader(TabController controller) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: MaterialSegmentedControl(
              children: {
                0: Text(
                  'Purchase List',
                  style: TextStyle(
                      color: _currentSelection == 0 ? white : textSecondary),
                ),
                1: Text(
                  'Expense',
                  style: TextStyle(
                      color: _currentSelection == 1 ? white : textSecondary),
                ),
                2: Text(
                  'Expense Category',
                  style: TextStyle(
                      color: _currentSelection == 2 ? white : textSecondary),
                ),
              },
              selectionIndex: _currentSelection,
              borderColor: Colors.grey,
              selectedColor: primaryColor,
              unselectedColor: Colors.white,
              borderRadius: 32.0,
              disabledChildren: [
                6,
              ],
              onSegmentChosen: (index) {
                print(index);
                setState(() {
                  _currentSelection = index;
                  controller.index = _currentSelection;
                });
              },
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 0.0,
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
                                EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 0.0),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 18,
                                ),
                                hintText: "Search Item",
                                hintStyle: TextStyle(
                                    fontSize: fontVerySmall,
                                    color: textSecondary),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent)),
                              ))),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Show :",
                            style: TextStyle(color: textSecondary),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(color: Colors.black12)),
                            child: DropdownButton<int>(
                              hint: Text(
                                '1',
                                style: TextStyle(color: textSecondary),
                              ),
                              dropdownColor: white,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 15,
                              underline: SizedBox(),
                              items: <int>[1, 2, 3, 4].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                              onChanged: (int? newVal) {},
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Entries",
                            style: TextStyle(color: textSecondary),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

}
