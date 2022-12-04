
import 'package:flutter/material.dart';
import 'package:klio_staff/constant/color.dart';
import 'package:klio_staff/constant/value.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class InventoryManagement extends StatefulWidget {
  const InventoryManagement({Key? key}) : super(key: key);

  @override
  State<InventoryManagement> createState() => _InventoryManagementState();
}

class _InventoryManagementState extends State<InventoryManagement>with SingleTickerProviderStateMixin {
  int _currentSelection = 0;
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(vsync: this, length: 6);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              itemTitleHeader(),
              customTapbarHeader(controller),
              Expanded(
                child: TabBarView(controller:controller, children: [
                  menuDataTable(),
                  menuDataTable(),
                  menuDataTable(),
                  menuDataTable(),
                  menuDataTable(),
                  menuDataTable(),
                ]),
              ),
            ],
          )),
    );
  }


  Widget menuDataTable() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Table(
          children: [
            TableRow(children: [
              TableCell(child: Center(child: Text('SL NO',style: TextStyle(color: textSecondary),))),
              TableCell(child: Center(child: Text('Reference No '))),
              TableCell(
                child: Center(child: Text('Date',style: TextStyle(color: textSecondary),)),
              ),
              TableCell(child: Center(child: Text('Supplier',style: TextStyle(color: textSecondary),))),
              TableCell(child: Center(child: Text('Grand Total',style: TextStyle(color: textSecondary),))),
              TableCell(child: Center(child: Text('Action',style: TextStyle(color: textSecondary),))),
            ]),
            TableRow(
                children: [
                  TableCell(child: Center(child: Text(''))),
                  TableCell(child: Center(child: Text(''))),
                  TableCell(child: Center(child: Text('')),),
                  TableCell(child: Center(child: Text(''))),
                  TableCell(child: Center(child: Text(''))),
                  TableCell(child: Center(child: Text(''))),
                ]
            ),
            TableRow(children: [
              TableCell(child: Center(child: Text('01'))),
              TableCell(child: Center(child: Text(''))),
              TableCell(child: Center(child: Text('Aminur Islam')),),
              TableCell(child: Center(child: Text('100'))),
              TableCell(child: Center(
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Image.asset("assets/settings.png",)
                ),
              )),
              TableCell(child: Center(
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xffE1FDE8),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Image.asset("assets/hide.png",height: 15,width: 15,color: Color(0xff00A600),),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xffFEF4E1),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Image.asset("assets/edit-alt.png",height: 15,width: 15,color: Color(0xffED7402),),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xffFFE7E6),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Image.asset("assets/delete.png",height: 15,width: 15,color: Color(0xffED0206),),
                    ),
                  ],
                ),
              )),
            ]),
          ],
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
          Container(
            child: Row(
              children: [
                Image.asset(
                  "assets/drawer.png",
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Inventory',
                  style: TextStyle(fontSize: fontMedium),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                OutlinedButton.icon(
                  icon: Icon(
                    Icons.add,
                    color: black,
                  ),
                  label: Text(
                    "Add New item",
                    style: TextStyle(color: black),
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
                // OutlinedButton.icon(
                //   icon: Icon(
                //     Icons.cloud_upload_outlined,
                //     color: white,
                //   ),
                //   label: Text(
                //     "Upload Menu",
                //     style: TextStyle(color: white),
                //   ),
                //   onPressed: () => print("it's pressed"),
                //   style: ElevatedButton.styleFrom(
                //     primary: primaryColor,
                //     side: BorderSide(width: 2.0, color: Colors.transparent),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(32.0),
                //     ),
                //   ),
                // ),
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
                  'Stock management',
                  style: TextStyle(
                      color: _currentSelection == 0 ? white : textSecondary),
                ),
                1: Text(
                  'Stock Adjustment',
                  style: TextStyle(
                      color: _currentSelection == 1 ? white : textSecondary),
                ),
                2: Text(
                  'Waste',
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
                3,
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
                margin: EdgeInsets.only(left: 200),
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
                                hintStyle: TextStyle(fontSize: fontVerySmall),
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
                          Text("Show :"),
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
                              hint: Text('1'),
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
                          Text("Entries"),
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
