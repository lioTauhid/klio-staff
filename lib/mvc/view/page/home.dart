import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klio_staff/mvc/view/page/food_management.dart';
import 'package:klio_staff/mvc/view/page/settings.dart';
import 'package:klio_staff/utils/utils.dart';
import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../../controller/home_controller.dart';
import '../../model/menu.dart';
import '../../model/menus.dart';
import '../../model/order.dart';
import '../dialog/custom_dialog.dart';
import '../widget/custom_widget.dart';
import 'dashboard.dart';
import 'drawer.dart';
import 'home_left_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

List pageList = [0, Dashboard(), FoodManagement(), Settings()];

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController());
  TextEditingController? textController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedCategory = -1;
  int selectedOrder = -1;
  bool darkMode = false;
  bool gridImage = true;

  @override
  void initState() {
    super.initState();
    applyThem(darkMode);
    homeController.loadHomeData();
    Utils.hidePopup();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryBackground,
      drawer: sideDrawer(),
      endDrawer: leftSideView(context, scaffoldKey.currentState),
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
                              EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 32,
                                width: 32,
                                child: IconButton(
                                    onPressed: () {
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                    padding: EdgeInsets.zero,
                                    icon: Image.asset('assets/drawer.png',
                                        fit: BoxFit.fitHeight,
                                        color: primaryColor)),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 2,
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
                                        width: 280,
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
                                        Image.asset('assets/reload.png',
                                            color: primaryText),
                                        secondaryBackground,
                                        8,
                                        15,
                                        40, onPressed: () {
                                      homeController.loadHomeData();
                                      Utils.hidePopup();
                                      Utils.hidePopup();
                                    }),
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
                        Obx(() {
                          return homeController.currentPage.value == 0
                              ? Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 40,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 15, 5),
                                        child: Obx(() {
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: homeController
                                                .category.value.data!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 15, 0),
                                                child: MaterialButton(
                                                    elevation: 0,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25),
                                                    color: selectedCategory ==
                                                            index
                                                        ? primaryColor
                                                        : secondaryBackground,
                                                    onPressed: () {
                                                      setState(() {
                                                        selectedCategory =
                                                            index;
                                                      });
                                                      homeController
                                                          .getMenuByCategory(
                                                              id: homeController
                                                                  .category
                                                                  .value
                                                                  .data![index]
                                                                  .id!);
                                                    },
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Text(
                                                      homeController
                                                          .category
                                                          .value
                                                          .data![index]
                                                          .name
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              selectedCategory ==
                                                                      index
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 10, 15, 10),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  size.width > size.height
                                                      ? 3
                                                      : 2,
                                              crossAxisSpacing: 12,
                                              mainAxisSpacing: 12,
                                              childAspectRatio: 2.5,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: homeController
                                                .menus.value.data!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    MenuData data =
                                                        homeController.menus
                                                            .value.data![index];
                                                    showCustomDialog(
                                                        context,
                                                        "Addons",
                                                        foodMenuBody(
                                                            context, data),
                                                        200,
                                                        400);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        gridImage
                                                            ? Expanded(
                                                                flex: 3,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  child: Image
                                                                      .network(
                                                                    homeController
                                                                        .menus
                                                                        .value
                                                                        .data![
                                                                            index]
                                                                        .image
                                                                        .toString(),
                                                                    height: Size
                                                                        .infinite
                                                                        .height,
                                                                    width: Size
                                                                        .infinite
                                                                        .width,
                                                                    fit: BoxFit
                                                                        .cover,
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
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: 3,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          primaryColor,
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
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            homeController.menus.value.data![index].name.toString(),
                                                                            style: TextStyle(
                                                                                fontSize: fontMediumExtra,
                                                                                color: primaryText,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                              homeController.menus.value.data![index].calorie.toString() + ' kcal | v',
                                                                              style: TextStyle(color: primaryText, fontSize: fontVerySmall)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  gridImage
                                                                      ? SizedBox()
                                                                      : Text(
                                                                          homeController
                                                                              .menus
                                                                              .value
                                                                              .data![index]
                                                                              .price
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              fontSize: fontMediumExtra,
                                                                              color: primaryColor,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  for (AllergiesDatum item in homeController
                                                                      .menus
                                                                      .value
                                                                      .data![
                                                                          index]
                                                                      .allergies!
                                                                      .data!
                                                                      .toList())
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              5),
                                                                      child: topBarIconBtn(
                                                                          Image.network(item
                                                                              .image
                                                                              .toString()),
                                                                          Color(
                                                                              0xff00C4D9),
                                                                          0,
                                                                          6,
                                                                          16,
                                                                          onPressed:
                                                                              () {}),
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
                                        padding:
                                            EdgeInsets.fromLTRB(15, 10, 15, 5),
                                        decoration: BoxDecoration(
                                          color: secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Obx(() {
                                                return ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  padding: EdgeInsets.zero,
                                                  itemCount: homeController
                                                      .orders
                                                      .value
                                                      .data!
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: alternate,
                                                      elevation: 1,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          side: selectedOrder ==
                                                                  index
                                                              ? BorderSide(
                                                                  width: 2,
                                                                  color:
                                                                      primaryColor)
                                                              : BorderSide
                                                                  .none),
                                                      child: Container(
                                                        width: 250,
                                                        alignment:
                                                            Alignment.center,
                                                        color: alternate,
                                                        child: ListTile(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedOrder =
                                                                  index;
                                                            });
                                                          },
                                                          leading: Image.asset(
                                                            orderTypes[
                                                                homeController
                                                                    .orders
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .type
                                                                    .toString()],
                                                            color: primaryColor,
                                                          ),
                                                          title: Text(
                                                              homeController
                                                                      .orders
                                                                      .value
                                                                      .data![
                                                                          index]
                                                                      .type
                                                                      .toString() ??
                                                                  '',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      fontMedium,
                                                                  color:
                                                                      primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          subtitle: Text(
                                                              'Table : ${Utils.getTables(homeController.orders.value.data![index].tables!.data!)}\n'
                                                              'Invoice : ${homeController.orders.value.data![index].invoice.toString()}',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    fontVerySmall,
                                                                color:
                                                                    primaryText,
                                                              )),
                                                          tileColor:
                                                              secondaryBackground,
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  bottomIconTextBtn(
                                                      'assets/delivery.png',
                                                      'Order Detail',
                                                      primaryColor,
                                                      onPressed: () async {
                                                    Utils.showLoading();
                                                    await homeController
                                                        .getOrder(homeController
                                                            .orders
                                                            .value
                                                            .data![
                                                                selectedOrder]
                                                            .id!
                                                            .toInt());
                                                    Utils.hidePopup();
                                                    print(homeController
                                                        .order.value
                                                        .toJson());
                                                    showCustomDialog(
                                                        context,
                                                        "Order Details",
                                                        orderDetail(context),
                                                        50,
                                                        400);
                                                  }),
                                                  SizedBox(width: 8),
                                                  bottomIconTextBtn(
                                                      'assets/circle-error.png',
                                                      'Cancel Order',
                                                      primaryColor,
                                                      onPressed: () {
                                                    showWarningDialog(
                                                        'Are you sure to cancel this order?',
                                                        onAccept: () async {
                                                      Utils.showLoading();
                                                      await homeController
                                                          .cancelOrder(
                                                              homeController
                                                                  .orders
                                                                  .value
                                                                  .data![
                                                                      selectedOrder]
                                                                  .id!
                                                                  .toInt());
                                                      await homeController
                                                          .getOrders();
                                                      Utils.hidePopup();
                                                      Utils.hidePopup();
                                                      Utils.showSnackBar(
                                                          "Order canceled successfully");
                                                    });
                                                  }),
                                                  SizedBox(width: 8),
                                                  bottomIconTextBtn(
                                                      'assets/edit-alt.png',
                                                      'Edit Order',
                                                      primaryColor,
                                                      onPressed: () {
                                                    showWarningDialog(
                                                        'Are you sure to edit this order?',
                                                        onAccept: () async {
                                                      Utils.showLoading();
                                                      homeController.cardList
                                                          .clear();
                                                      await homeController
                                                          .getOrder(homeController
                                                              .orders
                                                              .value
                                                              .data![
                                                                  selectedOrder]
                                                              .id!
                                                              .toInt());
                                                      for (OrderDetailsDatum order
                                                          in homeController
                                                              .order
                                                              .value
                                                              .data!
                                                              .orderDetails!
                                                              .data!
                                                              .toList()) {
                                                        MenuData menuData =
                                                            await MenuData(
                                                                id: order
                                                                    .foodId,
                                                                name: order
                                                                    .food!.name,
                                                                taxVat:
                                                                    order.vat,
                                                                quantity: order
                                                                    .quantity,
                                                                variant: order
                                                                    .variantId
                                                                    .toString(),
                                                                addons: order
                                                                    .addons,
                                                                variants:
                                                                    Variants(
                                                                        data: [
                                                                      VariantsDatum(
                                                                          id: order
                                                                              .variantId,
                                                                          name: order
                                                                              .variant!
                                                                              .name,
                                                                          price:
                                                                              order.price)
                                                                    ]));
                                                        homeController.cardList
                                                            .add(menuData);
                                                        homeController.cardList
                                                            .refresh();
                                                      }
                                                      homeController.isUpdate
                                                          .value = true;
                                                      Utils.hidePopup();
                                                      Utils.hidePopup();
                                                    });
                                                  }),
                                                  SizedBox(width: 8),
                                                  bottomIconTextBtn(
                                                      'assets/delivery.png',
                                                      'Kitchen Status',
                                                      primaryColor,
                                                      onPressed: () async {
                                                    Utils.showLoading();
                                                    await homeController
                                                        .getOrder(homeController
                                                            .orders
                                                            .value
                                                            .data![
                                                                selectedOrder]
                                                            .id!
                                                            .toInt());
                                                    Utils.hidePopup();
                                                    print(homeController
                                                        .order.value
                                                        .toJson());
                                                    showCustomDialog(
                                                        context,
                                                        "Order Status",
                                                        orderDetail(
                                                            context, true),
                                                        250,
                                                        400);
                                                  }),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : pageList[homeController.currentPage.value];
                        }),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  return homeController.currentPage.value == 0
                      ? size.width > size.height
                          ? Expanded(
                              flex: 30,
                              child: leftSideView(
                                  context, scaffoldKey.currentState),
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
                            )
                      : SizedBox();
                }),
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
