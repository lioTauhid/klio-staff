import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../../controller/home_controller.dart';
import '../widget/custom_widget.dart';

Widget sideDrawer() {
  HomeController homeController = Get.find();
  return Drawer(
    backgroundColor: primaryBackground,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
          child: Text(
            'klio',
            style: TextStyle(fontSize: fontBig, color: primaryText),
          ),
        ),
        ListTile(
          title: Text("POS Home", style: TextStyle(color: primaryText)),
          onTap: () {
            homeController.currentPage.value = 0;
            Get.back();
          },
          leading: sideBarIconBtn('assets/home.png', primaryText),
        ),
        ListTile(
          title: Text("Dashboard", style: TextStyle(color: primaryText)),
          onTap: () {
           homeController.currentPage.value = 1;
            Get.back();
          },
          leading: sideBarIconBtn('assets/grid.png', primaryText),
        ),
        ListTile(
            title:
                Text("Food Management", style: TextStyle(color: primaryText)),
            onTap: () {
               homeController.currentPage.value = 2;
               Get.back();
            },
            leading: sideBarIconBtn('assets/calendar.png', primaryText)),
        ListTile(
            title:
                Text("Orders Management", style: TextStyle(color: primaryText)),
            onTap: () {
              // homeController.currentPage.value = 6;
              // Get.back();
            },
            leading: sideBarIconBtn('assets/shopping-cart.png', primaryText)),
        ListTile(
            title: Text("Purchase Management", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 3;
              Get.back();
            },
            leading: sideBarIconBtn('assets/Dollar.png', primaryText)),
        ListTile(
            title: Text("Ingredient", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 4;
              Get.back();
            },
            leading: sideBarIconBtn('assets/book.png', primaryText)),
        ListTile(
            title: Text("Transactions", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 5;
              Get.back();
            },
            leading: sideBarIconBtn('assets/Dollar.png', primaryText)),
        ListTile(
            title: Text("Customer", style: TextStyle(color: primaryText)),
            onTap: () {},
            leading: sideBarIconBtn('assets/users.png', primaryText)),
        ListTile(
            title: Text("Reports", style: TextStyle(color: primaryText)),
            onTap: () {},
            leading: sideBarIconBtn('assets/book.png', primaryText)),
        ListTile(
            title: Text("Setting", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 6;
              Get.back();
            },
            leading: sideBarIconBtn('assets/settings.png', primaryText)),
      ],
    ),
  );
}
