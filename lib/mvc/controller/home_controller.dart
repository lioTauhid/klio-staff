import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:klio_staff/utils/utils.dart';
import '../../constant/value.dart';
import '../../service/api/api_client.dart';
import '../../service/local/shared_pref.dart';
import '../model/addons.dart';
import '../model/category.dart';
import '../model/customer.dart';
import '../model/menu.dart';
import '../model/order.dart';
import '../model/user.dart';
import 'error_controller.dart';

class HomeController extends GetxController with ErrorController {
  Rx<User> user = User().obs;
  Rx<Category> category = Category().obs;
  Rx<Menu> menu = Menu().obs;
  Rx<Customer> customer = Customer().obs;
  Rx<Order> order = Order().obs;
  Rx<Addons> addons = Addons().obs;
  RxString customerName = ''.obs;
  Rx<TextEditingController> controllerName = TextEditingController().obs;
  Rx<TextEditingController> controllerEmail = TextEditingController().obs;
  Rx<TextEditingController> controllerPhone = TextEditingController().obs;
  Rx<TextEditingController> controllerAddress = TextEditingController().obs;

  Future<void> loadHomeData() async {
    token = (await SharedPref().getValue('token'))!;
    Utils.showLoading();
    getCurrentUser();
    getCustomer();
    getOrder();
    await getMenuByCategory();

    var response = await ApiClient()
        .get('pos/category', header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
    category.value = categoryFromJson(response);
    Utils.hideLoading();
  }

  void getCurrentUser() async {
    var response = await ApiClient()
        .get('user', header: Utils.apiHeader)
        .catchError(handleApiError);

    /// check token validity to logout later
    if (response == null) return;
    user.value = userFromJson(response);
  }

  Future<void> getMenuByCategory({dynamic id = ''}) async {
    String endPoint = id == '' ? 'pos/menu' : 'pos/menu/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    menu.value = menuFromJson(response);
  }

  Future<void> getCustomer() async {
    var response = await ApiClient()
        .get('pos/customer', header: Utils.apiHeader)
        .catchError(handleApiError);
    customer.value = customerFromJson(response);
    customerName.value = customerFromJson(response).data!.first.name.toString();
  }

  Future<void> getOrder() async {
    var response = await ApiClient()
        .get('pos/order', header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
    order.value = orderFromJson(response);
  }

  void addCustomer() async {
    Utils.showLoading();
    var body = jsonEncode({
      "name": controllerName.value.text,
      "email": controllerEmail.value.text,
      "phone": controllerPhone.value.text,
      "delivery_address": controllerAddress.value.text
    });
    var response = await ApiClient()
        .post('pos/customer', body, header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
    getCustomer();
    Utils.hideLoading();
    Utils.showSnackBar("Customer added");
  }

  Future<void> getAddons(int id) async {
    var response = await ApiClient()
        .get('pos/menu/details/$id', header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) return;
    addons.value = addonsFromJson(response);
  }
}
