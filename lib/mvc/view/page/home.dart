import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klio_staff/utils/utils.dart';
import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../../controller/home_controller.dart';
import '../../model/menu.dart';
import '../dialog/custom_dialog.dart';
import '../widget/custom_widget.dart';
import 'drawer.dart';
import 'home_left_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController());
  TextEditingController? textController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool gridImage = true;
  int selectedCategory = -1;
  int selectedOrder = -1;
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    applyThem(darkMode);
    homeController.loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryBackground,
      drawer: sideDrawer(),
      endDrawer: leftSideView(context),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 75,
                  child: SizedBox(
                    height: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 20, 20, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  icon: Image.asset('assets/menu.png',
                                      height: 20,
                                      width: 20,
                                      color: primaryText)),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() {
                                      return Text(
                                        homeController.user.value.data!.name ??
                                            '',
                                        style: TextStyle(
                                            fontSize: fontMediumExtra,
                                            fontWeight: FontWeight.bold,
                                            color: primaryText),
                                      );
                                    }),
                                    Text(
                                        DateFormat('kk:mm:a | dd MMM')
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                            fontSize: fontVerySmall,
                                            color: primaryText)),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                        width: 240,
                                        height: 40,
                                        child: TextFormField(
                                            onChanged: (text) async {},
                                            onEditingComplete: () async {},
                                            keyboardType: TextInputType.text,
                                            style:
                                                TextStyle(fontSize: fontSmall),
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
                                                hintStyle: TextStyle(
                                                    fontSize: fontMedium,
                                                    color: primaryText),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide:
                                                        BorderSide.none),
                                                contentPadding:
                                                    EdgeInsets.zero))),
                                    SizedBox(width: 12),
                                    topBarIconBtn(
                                        Image.asset('assets/notification.png',
                                            color: primaryText),
                                        secondaryBackground,
                                        8,
                                        15,
                                        40,
                                        onPressed: () {}),
                                    SizedBox(width: 12),
                                    topBarIconBtn(
                                        Image.asset('assets/moon.png',
                                            color: primaryColor),
                                        secondaryBackground,
                                        8,
                                        15,
                                        40, onPressed: () {
                                      darkMode
                                          ? darkMode = false
                                          : darkMode = true;
                                      applyThem(darkMode);
                                      setState(() {});
                                    }),
                                    SizedBox(width: 12),
                                    topBarIconBtn(
                                        Image.asset('assets/filter-alt.png',
                                            color: primaryText),
                                        secondaryBackground,
                                        8,
                                        15,
                                        40, onPressed: () {
                                      gridImage
                                          ? gridImage = false
                                          : gridImage = true;
                                      setState(() {});
                                    }),
                                    SizedBox(width: 12),
                                    topBarIconBtn(
                                        Image.asset('assets/logout.png',
                                            color: white),
                                        primaryColor,
                                        8,
                                        15,
                                        40, onPressed: () async {
                                      homeController.loadHomeData();

                                      // final token =
                                      //     await SharedPref().getValue('token');
                                      // print(token);
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                          child: Obx(() {
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  homeController.category.value.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 15, 0),
                                  child: MaterialButton(
                                      elevation: 0,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 25),
                                      color: selectedCategory == index
                                          ? primaryColor
                                          : secondaryBackground,
                                      onPressed: () {
                                        setState(() {
                                          selectedCategory = index;
                                        });
                                        homeController.getMenuByCategory(
                                            id: homeController.category.value
                                                .data![index].id!);
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Text(
                                        homeController
                                            .category.value.data![index].name
                                            .toString(),
                                        style: TextStyle(
                                            color: selectedCategory == index
                                                ? white
                                                : primaryText,
                                            fontSize: fontMedium),
                                      )),
                                );
                              },
                            );
                          }),
                        ),
                        Expanded(
                          child: Obx(() {
                            return GridView.builder(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    size.width > size.height ? 3 : 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 2.5,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: homeController.menu.value.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: secondaryBackground,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: GestureDetector(
                                    onTap: () async {
                                      Utils.showLoading();
                                      await homeController.getAddons(homeController
                                          .menu.value.data![index].id!
                                          .toInt());
                                      Utils.hideLoading();
                                      print(homeController.addons.value.data!.name);
                                      showCustomDialog(context, "Addons",
                                          foodMenuBody(context,homeController.addons.value.data!), 200, 400);
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          gridImage
                                              ? Expanded(
                                                  flex: 3,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      homeController.menu.value
                                                          .data![index].image
                                                          .toString(),
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
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 3,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: primaryColor,
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
                                                              homeController
                                                                  .menu
                                                                  .value
                                                                  .data![index]
                                                                  .name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      fontMediumExtra,
                                                                  color:
                                                                      primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                                homeController
                                                                        .menu
                                                                        .value
                                                                        .data![
                                                                            index]
                                                                        .calorie
                                                                        .toString() +
                                                                    ' kcal | v',
                                                                style: TextStyle(
                                                                    color:
                                                                        primaryText,
                                                                    fontSize:
                                                                        fontVerySmall)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    gridImage
                                                        ? SizedBox()
                                                        : Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    0,
                                                                    0,
                                                                    10,
                                                                    0),
                                                            child: Text(
                                                              homeController
                                                                  .menu
                                                                  .value
                                                                  .data![index]
                                                                  .price
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      fontMediumExtra,
                                                                  color:
                                                                      primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    for (AllergiesDatum item
                                                        in homeController
                                                            .menu
                                                            .value
                                                            .data![index]
                                                            .allergies!
                                                            .data!
                                                            .toList())
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 5),
                                                        child: topBarIconBtn(
                                                            Image.network(item
                                                                .image
                                                                .toString()),
                                                            Color(0xff00C4D9),
                                                            0,
                                                            6,
                                                            16,
                                                            onPressed: () {}),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                        Container(
                          width: double.infinity,
                          height: 150,
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                          decoration: BoxDecoration(
                            color: secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Obx(() {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.zero,
                                    itemCount:
                                        homeController.order.value.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: alternate,
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: selectedOrder == index
                                                ? BorderSide(
                                                    width: 2,
                                                    color: primaryColor)
                                                : BorderSide.none),
                                        child: Container(
                                          width: 250,
                                          alignment: Alignment.center,
                                          color: alternate,
                                          child: ListTile(
                                            onTap: () {
                                              setState(() {
                                                selectedOrder = index;
                                              });
                                            },
                                            leading: Image.asset(
                                              "assets/takeway.png",
                                              color: primaryColor,
                                            ),
                                            title: Text(
                                                homeController.order.value
                                                        .data![index].type
                                                        .toString() ??
                                                    '',
                                                style: TextStyle(
                                                    fontSize: fontMedium,
                                                    color: primaryText,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            subtitle: Text(
                                                'Table : ${Utils.getTables(homeController.order.value.data![index].tables!.data!)}\n'
                                                'Invoice : ${homeController.order.value.data![index].invoice.toString()}',
                                                style: TextStyle(
                                                  fontSize: fontVerySmall,
                                                  color: primaryText,
                                                )),
                                            tileColor: secondaryBackground,
                                            dense: false,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    bottomIconTextBtn(
                                        'assets/delivery.png',
                                        'Order Detail',
                                        primaryColor, onPressed: () {
                                      showCustomDialog(
                                          context,
                                          "Table Reservation",
                                          orderDetail(context),
                                          50,
                                          400);
                                    }),
                                    SizedBox(width: 8),
                                    bottomIconTextBtn('assets/circle-error.png',
                                        'Cancel Order', primaryColor,
                                        onPressed: () {}),
                                    SizedBox(width: 8),
                                    bottomIconTextBtn('assets/edit-alt.png',
                                        'Edit Order', primaryColor,
                                        onPressed: () {}),
                                    SizedBox(width: 8),
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
                        child: leftSideView(context),
                      )
                    : Container(
                        height: 50,
                        width: 15,
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(100)),
                          color: primaryColor,
                        ),
                        child: MaterialButton(
                            onPressed: () {
                              scaffoldKey.currentState!.openEndDrawer();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: white,
                            ),
                            padding: EdgeInsets.all(12)),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }
}
