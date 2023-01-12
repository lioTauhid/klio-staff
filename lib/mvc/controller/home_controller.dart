import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:klio_staff/mvc/model/Customer.dart';
import 'package:klio_staff/mvc/model/settings.dart';
import 'package:klio_staff/utils/utils.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import '../../constant/value.dart';
import '../../service/api/api_client.dart';
import '../../service/local/shared_pref.dart';
import '../model/Tables.dart';
import '../model/dash_model.dart';
import '../model/menu.dart';
import '../model/category.dart';
import '../model/customers.dart';
import '../model/menus.dart';
import '../model/online_order.dart';
import '../model/order.dart';
import '../model/orders.dart';
import '../model/user.dart';
import 'error_controller.dart';

class HomeController extends GetxController with ErrorController {
  Rx<User> user = User().obs;
  Rx<Category> category = Category().obs;
  Rx<Menus> menus = Menus().obs;
  Rx<Customers> customers = Customers().obs;
  Rx<Orders> orders = Orders().obs;
  Rx<Order> order = Order().obs;
  Rx<OnlineOrder> onlineOrder = OnlineOrder().obs;
  Rx<Settings> settings = Settings().obs;
  Rx<TableList> tables = TableList(data: []).obs;
  Rx<TextEditingController> controllerName =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> controllerEmail =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> controllerPhone =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> controllerAddress =
      TextEditingController(text: '').obs;
  RxBool withoutTable = false.obs;
  Rx<DashData> dashData = DashData().obs;

  // temp variables
  RxList filteredMenu = [].obs;
  RxString customerName = ''.obs;
  Rx<MenuData> menuData = MenuData().obs;
  RxList cardList = [].obs;
  // RxDouble variantPrice = 0.0.obs;
  RxDouble discount = 0.0.obs;
  RxString discType = 'In Flat Amount'.obs;
  RxInt giveAmount = 0.obs;
  RxString payMethod = 'Cash'.obs;
  int orderUpdateId = 0;

  // ui variables
  RxInt topBtnPosition = 1.obs;
  RxBool isUpdate = false.obs;
  RxBool reward = false.obs;
  RxInt selectedOrder = (-1).obs;
  RxInt currentPage = 0.obs;

  Future<void> loadHomeData() async {
    token = (await SharedPref().getValue('token'))!;
    try {
      await SunmiPrinter.bindingPrinter(); // must bind the printer first
      await SunmiPrinter.lcdInitialize(); //Initialize the LCD screen
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
    Utils.showLoading();
    await getCurrentUserData();
    getOrders();
    await getCustomers();
    await getCategory();
    await getMenuByKeyword();
    getOnlineOrder(0);
    Utils.hidePopup();
    Utils.hidePopup();
    Utils.hidePopup();
  }

  Future<void> getCurrentUserData() async {
    var response = await ApiClient()
        .get('user', header: Utils.apiHeader)
        .catchError(handleApiError);

    /// check token validity to logout later
    if (response == null) return;
    user.value = userFromJson(response);
    response = await ApiClient()
        .get('setting', header: Utils.apiHeader)
        .catchError(handleApiError);
    settings.value = settingsFromJson(response);
  }

  Future<void> getCategory() async {
    var response = await ApiClient()
        .get('pos/category', header: Utils.apiHeader)
        .catchError(handleApiError);
    category.value = categoryFromJson(response);
  }

  Future<void> getDashboardData() async {
    token = (await SharedPref().getValue('token'))!;
    Utils.showLoading();
    var response = await ApiClient()
        .get('dashboard', header: Utils.apiHeader)
        .catchError(handleApiError);
    dashData.value = dashDataFromJson(response);
    Utils.hidePopup();
  }

  Future<void> getMenuByKeyword({String keyword = ''}) async {
    Map<String, String> qParams = {'keyword': keyword};
    String endPoint = "pos/menu";
    print(endPoint);
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader, query: qParams);
    // .catchError(handleApiError);
    print(response);
    menus.value = await menuFromJson(response);
    filteredMenu.value = Utils.filterCategory(menus.value, -1)!;
  }

  Future<void> getCustomers() async {
    var response = await ApiClient()
        .get('pos/customer', header: Utils.apiHeader)
        .catchError(handleApiError);
    customers.value = customerFromJson(response);
    customerName.value = customerFromJson(response).data!.first.name.toString();
  }

  Future<Customer> getCustomer(String id) async {
    var response = await ApiClient()
        .get('pos/customer/$id', header: Utils.apiHeader)
        .catchError(handleApiError);
    return cusFromJson(response);
  }

  void getOrders() async {
    var response = await ApiClient()
        .get('pos/order', header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
    orders.value = ordersFromJson(response);
  }

  Future<void> cancelOrder(int id) async {
    var response = await ApiClient()
        .post('pos/order/$id/cancel', jsonEncode({}), header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
  }

  Future<bool> acceptOrder(int id) async {
    var response = await ApiClient()
        .put('pos/order/$id/accept', jsonEncode({}), header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) false;
    return true;
  }

  Future<void> getOrder(int id) async {
    var response = await ApiClient()
        .get('pos/order/$id', header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
    order.value = orderFromJson(response);
  }

  Future<void> getTables() async {
    var response = await ApiClient()
        .get('pos/table', header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
    tables.value = tableListFromJson(response);
  }

  void addUpdateCustomer(bool add, {String id = ''}) async {
    Utils.showLoading();
    var body = jsonEncode({
      "first_name": controllerName.value.text,
      "email": controllerEmail.value.text,
      "phone": controllerPhone.value.text,
      "delivery_address": controllerAddress.value.text
    });
    var response;
    if (add) {
      response = await ApiClient()
          .post('pos/customer', body, header: Utils.apiHeader)
          .catchError(handleApiError);
    } else {
      response = await ApiClient()
          .put('pos/customer/$id', body, header: Utils.apiHeader)
          .catchError(handleApiError);
    }
    if (response == null) return;
    getCustomers();
    Utils.hidePopup();
    Utils.showSnackBar("Customer added successfully");
  }

  void addUpdateOrder() {
    if (withoutTable.isFalse) {
      Utils.showSnackBar("No table selected for new order");
      return;
    }
    Utils.showLoading();
    List<Map> items = [{}];
    cardList.value.forEach((element) {
      MenuData add = element;
      items.add(
        {
          "id": add.id,
          "quantity": add.quantity,
          "variant_id": int.parse(add.variant!),
          "addons": [
            for (var i in add.addons!.data!)
              if (i.isChecked == true) {"id": i.id, "quantity": i.quantity}
          ],
        },
      );
    });
    items.removeAt(0);
    var body = jsonEncode({
      "order_type": orderTypes.entries.elementAt(topBtnPosition.value - 1).key,
      "customer": Utils.findIdByListNearValue(
          customers.value.data!.toList(), customerName.value),
      "items": items,
      "discount": discount.value ?? 0,
      "tables": [
        for (var i in tables.value!.data!.toList())
          if (i.person != 0)
            {"id": i.id, "person": int.parse(i.person.toString())}
      ]
    });
    print(body);
    var response;
    if (isUpdate.value) {
      response = ApiClient()
          .put('pos/order/${order.value.data!.id!.toInt()}', body,
              header: Utils.apiHeader)
          .catchError(handleApiError);
    } else {
      response = ApiClient()
          .post('pos/order', body, header: Utils.apiHeader)
          .catchError(handleApiError);
    }
    if (response == null) return;
    cardList.clear();
    tables.value.data!.clear();
    discount.value = 0;
    withoutTable.value = false;

    getOrders();
    orders.refresh();
    Utils.hidePopup();
    Utils.showSnackBar("Order added successfully");
  }

  Future<bool> orderPayment() async {
    var body = jsonEncode({
      "order_id": order.value.data!.id,
      "payment_method": payMethod.value,
      "give_amount": giveAmount.value,
      "use_rewards": reward.value ? 'use_rewards' : '',
    });
    var response = await ApiClient()
        .post('pos/payment', body, header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) false;
    Utils.showSnackBar("Order placed successfully");
    return true;
  }

  Future<void> getOnlineOrder(int id) async {
    var response = await ApiClient()
        .get('pos/order/online', header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
    onlineOrder.value = onlineOrderFromJson(response);
  }
}
