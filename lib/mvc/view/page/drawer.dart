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
          title: Text(
            "Home",
            style: TextStyle(color: primaryText),
          ),
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
            title: Text("Notification", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 2;
              Get.back();
            },
            leading: sideBarIconBtn('assets/notification.png', primaryText)),
        ListTile(
            title: Text("Event", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 2;
              Get.back();
            },
            leading: sideBarIconBtn('assets/calendar.png', primaryText)),
        ListTile(
            title: Text("Cart", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 2;
              Get.back();
            },
            leading: sideBarIconBtn('assets/shopping-cart.png', primaryText)),
        ListTile(
            title: Text("Dine In", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 2;
              Get.back();
            },
            leading: sideBarIconBtn('assets/table.png', primaryText)),
        ListTile(
            title: Text("Financial", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 2;
              Get.back();
            },
            leading: sideBarIconBtn('assets/Dollar.png', primaryText)),
        ListTile(
            title: Text("Bookmark", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 2;
              Get.back();
            },
            leading: sideBarIconBtn('assets/book.png', primaryText)),
        ListTile(
            title: Text("Listing", style: TextStyle(color: primaryText)),
            onTap: () {},
            leading: sideBarIconBtn('assets/list.png', primaryText)),
        ListTile(
            title: Text("User", style: TextStyle(color: primaryText)),
            onTap: () {},
            leading: sideBarIconBtn('assets/users.png', primaryText)),
        ListTile(
            title: Text("Setting", style: TextStyle(color: primaryText)),
            onTap: () {
              homeController.currentPage.value = 2;
              Get.back();
            },
            leading: sideBarIconBtn('assets/settings.png', primaryText)),
      ],
    ),
  );
}
