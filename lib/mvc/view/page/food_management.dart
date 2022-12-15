import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:klio_staff/constant/color.dart';
import 'package:klio_staff/constant/value.dart';
import 'package:klio_staff/mvc/controller/food_management_controller.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class FoodManagement extends StatefulWidget {
  const FoodManagement({Key? key}) : super(key: key);

  @override
  State<FoodManagement> createState() => _FoodManagementState();
}

class _FoodManagementState extends State<FoodManagement>
    with SingleTickerProviderStateMixin {
  FoodManagementController foodCtlr = Get.put(FoodManagementController());
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
                  menuDataTable(),
                  MealPeriodDataTable(),
                  FoodCategoryDataTable(),
                  FoodAllergyDataTable(),
                  FoodAddonsDataTable(),
                  FoodVariantsDataTable(),
                ]),
              )
            ],
          ),
        )
    );

  }

  Widget menuDataTable() {
    return Card(
      color: secondaryBackground,
      child: SingleChildScrollView(
        child: GetBuilder<FoodManagementController>(
            builder: (controller) {
              return DataTable(
                  dataRowHeight: 70,
                  columns: [
                    // column to set the name
                    DataColumn(label: Text('SL NO',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Name',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Price',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Vat (%)',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Image',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Image',style: TextStyle(color:textSecondary),),),
                  ],

                  rows: controller.menusData.value.data.reversed
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
                          Text('${item.price ?? ""}'),
                        ),
                        DataCell(
                          Text('${item.taxVat ?? ""}'),
                        ),
                        DataCell(
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    item.image,
                                  ),
                                  //    image: NetworkImage('https://picsum.photos/250?image=9',),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
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
  Widget MealPeriodDataTable() {
    return Card(
      color: secondaryBackground,
      child: SingleChildScrollView(
        child: GetBuilder<FoodManagementController>(
            builder: (controller) {
              return DataTable(
                  dataRowHeight: 70,
                  columnSpacing: 50,
                  columns: [
                    // column to set the name
                    DataColumn(label: Text('SL NO',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Name',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Image',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Action',style: TextStyle(color:textSecondary),),),
                  ],

                  rows: controller.mealPeriod.value.data.reversed
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
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    item.image,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
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
  Widget FoodCategoryDataTable() {
    return Card(
      color: secondaryBackground,
      child: SingleChildScrollView(
        child: GetBuilder<FoodManagementController>(
            builder: (controller) {
              return DataTable(
                  dataRowHeight: 70,
                  columnSpacing: 50,
                  columns: [
                    // column to set the name
                    DataColumn(label: Text('SL NO',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Name',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Image',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('is Drinks',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Action',style: TextStyle(color:textSecondary),),),
                  ],

                  rows: controller.foodMenuCategory.value.data.reversed
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
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    item.image,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        DataCell(
                          Text('${item.isDrinks ?? ""}'),
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
  Widget FoodAllergyDataTable() {
    return Card(
      color: secondaryBackground,
      child: SingleChildScrollView(
        child: GetBuilder<FoodManagementController>(
            builder: (controller) {
              return DataTable(
                  dataRowHeight: 70,
                  columnSpacing: 50,
                  columns: [
                    // column to set the name
                    DataColumn(label: Text('SL NO',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Name',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Icon',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Action',style: TextStyle(color:textSecondary),),),
                  ],

                  rows: controller.foodMenuAllergy.value.data.reversed
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
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    item.image,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
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
  Widget FoodAddonsDataTable() {
    return Card(
      color: secondaryBackground,
      child: SingleChildScrollView(
        child: GetBuilder<FoodManagementController>(
            builder: (controller) {
              return DataTable(
                  dataRowHeight: 80,
                  // columnSpacing: 120,
                  horizontalMargin: 15,
                  columns: [
                    DataColumn(label: Text('SL.No',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Name',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Price',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Image',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Details',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Action',style: TextStyle(color:textSecondary),),),
                  ],

                  rows: controller.foodAddons.value.data.reversed
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
                          Text('${item.price ?? ""}'),
                        ),
                        DataCell(
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    item.image,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        DataCell(
                          Text('${item.details ?? ""}'),
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
  Widget FoodVariantsDataTable() {
    return Card(
      color: secondaryBackground,
      child: SingleChildScrollView(
        child: GetBuilder<FoodManagementController>(
            builder: (controller) {
              return DataTable(
                  dataRowHeight: 70,
                  columnSpacing: 50,
                  columns: [
                    // column to set the name
                    DataColumn(label: Text('SL NO',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Name',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Menu Name',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Price',style: TextStyle(color:textSecondary),),),
                    DataColumn(label: Text('Action',style: TextStyle(color:textSecondary),),),
                  ],

                  rows: controller.foodVariants.value.data.reversed
                      .map(
                        (item) => DataRow(
                      cells: [
                        DataCell(
                          Text('${item.id ?? ""}'),
                        ),
                        DataCell(
                          Text('${item.food.name ?? ""}'),
                        ),
                        DataCell(
                          Text('${item.name ?? ""}'),
                        ),
                        DataCell(
                          Text('${item.price ?? ""}'),
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
              'Menu',
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
                    "Add New Menu",
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
                  'Menus',
                  style: TextStyle(
                      color: _currentSelection == 0 ? white : textSecondary),
                ),
                1: Text(
                  'Meal Period',
                  style: TextStyle(
                      color: _currentSelection == 1 ? white : textSecondary),
                ),
                2: Text(
                  'Menu Category',
                  style: TextStyle(
                      color: _currentSelection == 2 ? white : textSecondary),
                ),
                3: Text(
                  'Menu Allergy',
                  style: TextStyle(
                      color: _currentSelection == 3 ? white : textSecondary),
                ),
                4: Text(
                  'Menu Addons',
                  style: TextStyle(
                      color: _currentSelection == 4 ? white : textSecondary),
                ),
                5: Text(
                  'Menu variants',
                  style: TextStyle(
                      color: _currentSelection == 5 ? white : textSecondary),
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