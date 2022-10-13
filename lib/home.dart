import 'package:flutter/material.dart';
import 'package:klio_staff/side_drawer.dart';

import 'constant.dart';
import 'custom_widget.dart';
import 'left_side.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String? dropDownValue;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool gridImage = true;
  int selectedCategory = 0;
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    applyThem(darkMode);
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryBackground,
      drawer: sideDrawer(),
      endDrawer: leftSideView(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: secondaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Expanded(
                //   flex: 4,
                //   child: Container(
                //     height: double.infinity,
                //     decoration: BoxDecoration(
                //       color: secondaryBackground,
                //     ),
                //     child: GestureDetector(
                //       onTap: () {
                //         scaffoldKey.currentState!.openDrawer();
                //       },
                //       child: Column(
                //         mainAxisSize: MainAxisSize.max,
                //         children: [
                //           Padding(
                //             padding:
                //                 EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                //             child: Text(
                //               'klio',
                //               style: TextStyle(
                //                 fontFamily: 'Poppins',
                //                 fontSize: 22,
                //               ),
                //             ),
                //           ),
                //           sideBarIconBtn('assets/home.png', textSecondary),
                //           SizedBox(height: 5),
                //           sideBarIconBtn('assets/grid.png', primaryColor),
                //           SizedBox(height: 5),
                //           sideBarIconBtn(
                //               'assets/notification.png', textSecondary),
                //           SizedBox(height: 5),
                //           sideBarIconBtn('assets/calendar.png', textSecondary),
                //           SizedBox(height: 5),
                //           sideBarIconBtn(
                //               'assets/shopping-cart.png', textSecondary),
                //           SizedBox(height: 5),
                //           sideBarIconBtn('assets/table.png', textSecondary),
                //           SizedBox(height: 5),
                //           sideBarIconBtn('assets/Dollar.png', textSecondary),
                //           SizedBox(height: 5),
                //           sideBarIconBtn('assets/book.png', textSecondary),
                //           SizedBox(height: 5),
                //           sideBarIconBtn('assets/list.png', textSecondary),
                //           SizedBox(height: 5),
                //           sideBarIconBtn('assets/users.png', textSecondary),
                //           SizedBox(height: 20),
                //           sideBarIconBtn('assets/settings.png', textSecondary)
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  flex: 75,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 20, 20, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  icon: Image.asset('assets/menu.png', color: primaryText)),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome, Amirul',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold, color: primaryText),
                                    ),
                                    Text('12:14 AM | 22 july',
                                        style: TextStyle(fontSize: 10, color: primaryText)),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        width: 300,
                                        height: 40,
                                        child: TextFormField(
                                            onChanged: (text) async {},
                                            onEditingComplete: () async {},
                                            keyboardType: TextInputType.text,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15),
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: secondaryBackground,
                                                prefixIcon: Image.asset(
                                                    "assets/search.png",
                                                    color: primaryText),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: textSecondary,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                hintText: 'Search item',
                                                hintStyle:
                                                    TextStyle(fontSize: 12, color: primaryText),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide:
                                                        BorderSide.none),
                                                contentPadding:
                                                    EdgeInsets.zero))),
                                    SizedBox(width: 15),
                                    topBarIconBtn(
                                        'assets/notification.png',
                                        secondaryBackground,
                                        primaryText,
                                        8,
                                        15,
                                        40,
                                        onPressed: () {}),
                                    SizedBox(width: 15),
                                    topBarIconBtn(
                                        'assets/moon.png',
                                        secondaryBackground,
                                        primaryColor,
                                        8,
                                        15,
                                        40,
                                        onPressed: () {
                                          darkMode
                                              ? darkMode = false
                                              : darkMode = true;
                                          applyThem(darkMode);
                                          setState(() {});
                                        }),
                                    SizedBox(width: 15),
                                    topBarIconBtn(
                                        'assets/filter-alt.png',
                                        secondaryBackground,
                                        primaryText,
                                        8,
                                        15,
                                        40, onPressed: () {
                                        gridImage
                                            ? gridImage = false
                                            : gridImage = true;
                                        setState(() {});
                                    }),
                                    SizedBox(width: 15),
                                    topBarIconBtn(
                                        'assets/logout.png',
                                        primaryColor,
                                        secondaryBackground,
                                        8,
                                        15,
                                        40,
                                        onPressed: () {}),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: primaryBackground,
                            ),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: MaterialButton(
                                      elevation: 0,
                                      color: selectedCategory==index?primaryColor:secondaryBackground,
                                      onPressed: () {
                                        setState(() {
                                          selectedCategory = index;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Text(
                                        "Ice Cream",
                                        style: TextStyle(color: selectedCategory==index?white :primaryText),
                                      )),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 2.3,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  // width: 40,
                                  // height: 50,
                                  decoration: BoxDecoration(
                                    color: secondaryBackground,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6, 6, 6, 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        gridImage
                                            ? Expanded(
                                                flex: 3,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                    'assets/imm.png',
                                                    height: double.infinity,
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 3,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: alternate,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Chicken Roasts and fried',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                              'Chicken made and fried rice',
                                                              style: TextStyle(
                                                                  color: primaryText,
                                                                  fontSize:
                                                                      10)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 5, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    topBarIconBtn(
                                                        'assets/egg.png',
                                                        Colors.white60,
                                                        secondaryBackground,
                                                        5,
                                                        6,
                                                        20,
                                                        onPressed: () {}),
                                                    SizedBox(width: 5),
                                                    topBarIconBtn(
                                                        'assets/Sellfish.png',
                                                        secondaryColor,
                                                        secondaryBackground,
                                                        5,
                                                        6,
                                                        20,
                                                        onPressed: () {}),
                                                    SizedBox(width: 5),
                                                    topBarIconBtn(
                                                        'assets/wine.png',
                                                        Colors.brown,
                                                        secondaryBackground,
                                                        5,
                                                        6,
                                                        20,
                                                        onPressed: () {}),
                                                    SizedBox(width: 5),
                                                    topBarIconBtn(
                                                        'assets/bean.png',
                                                        Colors.green,
                                                        secondaryBackground,
                                                        5,
                                                        6,
                                                        20,
                                                        onPressed: () {}),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 150,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 4,
                                child: ListView.builder(
                                  padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 20,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0xFFF5F5F5),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        width: 250,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: secondaryBackground,
                                        ),
                                        child: ListTile(
                                          leading: Image.asset(
                                            "assets/takeway.png",
                                            color: primaryColor,
                                          ),
                                          title: Text('TAKEWAY',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: primaryText,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(
                                              'Table : N/A\nStatus : Out of Delivery',
                                              style: TextStyle(fontSize: 14, color:primaryText,
                                              )),
                                          tileColor: secondaryBackground,
                                          dense: false,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    bottomIconTextBtn('assets/delivery.png',
                                        'Order Detail', primaryColor,
                                        onPressed: () {}),
                                    bottomIconTextBtn('assets/circle-error.png',
                                        'Cancel Order', primaryColor,
                                        onPressed: () {}),
                                    bottomIconTextBtn('assets/edit-alt.png',
                                        'Edit Order', primaryColor,
                                        onPressed: () {}),
                                    bottomIconTextBtn('assets/delivery.png',
                                        'Kitchen Status', primaryColor,
                                        onPressed: () {}),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                size.width > size.height
                    ? Expanded(
                        flex: 30,
                        child: leftSideView(),
                      )
                    : Row(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
