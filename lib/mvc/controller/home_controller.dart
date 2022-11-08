import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:klio_staff/mvc/model/Customer.dart';
import 'package:klio_staff/mvc/model/settings.dart';
import 'package:klio_staff/utils/utils.dart';
import '../../constant/value.dart';
import '../../service/api/api_client.dart';
import '../../service/local/shared_pref.dart';
import '../model/Tables.dart';
import '../model/addons.dart';
import '../model/category.dart';
import '../model/customers.dart';
import '../model/menu.dart';
import '../model/order.dart';
import '../model/orders.dart';
import '../model/user.dart';
import 'error_controller.dart';

class HomeController extends GetxController with ErrorController {
  Rx<User> user = User().obs;
  Rx<Category> category = Category().obs;
  Rx<Menu> menu = Menu().obs;
  Rx<Customers> customers = Customers().obs;
  Rx<Orders> orders = Orders().obs;
  Rx<Order> order = Order().obs;
  Rx<Addons> addons = Addons().obs;
  Rx<Settings> settings = Settings().obs;
  Rx<TableList> tables = TableList().obs;
  RxString customerName = ''.obs;
  Rx<TextEditingController> controllerName = TextEditingController().obs;
  Rx<TextEditingController> controllerEmail = TextEditingController().obs;
  Rx<TextEditingController> controllerPhone = TextEditingController().obs;
  Rx<TextEditingController> controllerAddress = TextEditingController().obs;
  RxBool withoutTable = false.obs;

  // temp variables
  Rx<AddonsData> menuData = AddonsData().obs;
  RxList cardList = [].obs;
  RxDouble variantPrice = 0.0.obs;
  RxDouble discount = 0.0.obs;
  RxString discType = 'In Flat Amount'.obs;

  // ui variables
  RxInt topBtnPosition = 1.obs;

  Future<void> loadHomeData() async {
    token = (await SharedPref().getValue('token'))!;
    Utils.showLoading();
    await getCurrentUserData();
    await getCustomers();
    await getOrders();
    await getMenuByCategory();
    await getCategory();
    Utils.hideLoading();
  }

  Future<void> getCategory() async {
    var response = await ApiClient()
        .get('pos/category', header: Utils.apiHeader)
        .catchError(handleApiError);
    category.value = categoryFromJson(response);
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

  Future<void> getMenuByCategory({dynamic id = ''}) async {
    String endPoint = id == '' ? 'pos/menu' : 'pos/menu/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    menu.value = menuFromJson(response);
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

  Future<void> getOrders() async {
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
    tables.value = tablesFromJson(response);
  }

  void addUpdateCustomer(bool add, {String id = ''}) async {
    Utils.showLoading();
    var body = jsonEncode({
      "name": controllerName.value.text,
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
    Utils.hideLoading();
    Utils.showSnackBar("Customer added successfully");
  }

  void addNewOrder() {
    if (withoutTable.isFalse) {
      Utils.showSnackBar("No table selected for new order");
      return;
    }
    Utils.showLoading();
    List<Map> items = [{}];
    cardList.value.forEach((element) {
      AddonsData add = element;
      items.add(
        {
          "id": add.id,
          "quantity": add.qty,
          "variant_id": int.parse(add.variant!),
          "addons": [
            for (var i in add.addons!.data!)
              if (i.isChecked == true) {"id": i.id, "quantity": i.qty}
          ],
        },
      );
    });
    items.removeAt(0);
    var body = jsonEncode({
      "order_type": leftTopBtnTxt[topBtnPosition.value - 1].keys.first,
      "customer": Utils.findIdByListNearValue(
          customers.value.data!.toList(), customerName.value),
      "items": items,
      "discount": discount.value ?? 0,
      "tables": [
        for (var i in tables.value.data!.toList())
          if (i.person != '')
            {"id": i.id, "person": int.parse(i.person.toString())}
      ]
    });
    print(body);
    var response = ApiClient()
        .post('pos/order', body, header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
    cardList.clear();
    tables.value.data!.clear();
    discount.value = 0;
    withoutTable.value = false;

    getOrders();
    Utils.hideLoading();
    Utils.showSnackBar("Order added successfully");
  }

  Future<void> getAddons(int id) async {
    var response = await ApiClient()
        .get('pos/menu/details/$id', header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
    addons.value = addonsFromJson(response);
  }
}
