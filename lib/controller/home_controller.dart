import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:klio_staff/controller/error_controller.dart';
import 'package:klio_staff/model/menu.dart';
import 'package:klio_staff/model/user.dart';
import 'package:klio_staff/utils/utils.dart';

import '../model/category.dart';
import '../model/customer.dart';
import '../service/api/api_client.dart';
import '../service/local/shared_pref.dart';

class HomeController extends GetxController with ErrorController {
  RxString token = ''.obs;
  Rx<User> user = User(data: Data()).obs;
  Rx<Category> category = Category().obs;
  Rx<Menu> menu = Menu().obs;
  Rx<Customer> customer = Customer().obs;
  RxString customerName = ''.obs;
  Rx<TextEditingController> controllerName = TextEditingController().obs;
  Rx<TextEditingController> controllerEmail = TextEditingController().obs;
  Rx<TextEditingController> controllerPhone = TextEditingController().obs;
  Rx<TextEditingController> controllerAddress = TextEditingController().obs;

  Future<void> loadHomeData() async {
    token.value = (await SharedPref().getValue('token'))!;
    Utils.showLoading();
    getCurrentUser();
    getPosDatum();
  }

  void getCurrentUser() async {
    var response = await ApiClient().get('api/user', header: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }).catchError(handleApiError);
    if (response == null) return;
    user.value = userFromJson(response);
  }

  void getPosDatum() async {
    var response = await ApiClient().get('api/pos/category', header: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }).catchError(handleApiError);
    category.value = categoryFromJson(response);

    getCustomer();
    getMenuByCategory();

    if (response == null) return;
    Utils.hideLoading();
  }

  Future<void> getMenuByCategory({dynamic id = ''}) async {
    Utils.showLoading();
    String endPoint = id == '' ? 'api/pos/menu' : 'api/pos/menu/$id';
    var response = await ApiClient().get(endPoint, header: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }).catchError(handleApiError);
    menu.value = menuFromJson(response);
    Utils.hideLoading();
  }

  Future<void> getCustomer() async {
    var response = await ApiClient().get('api/pos/customer', header: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }).catchError(handleApiError);
    customer.value = customerFromJson(response);
    customerName.value = customerFromJson(response).data!.first.name!;
  }

  void addCustomer() async {
    Utils.showLoading();
    var response = await ApiClient().post('api/customer', {
      'name': controllerName.value.text,
      'email': controllerEmail.value.text,
      'phone': controllerPhone.value.text,
      'delivery_address': controllerAddress.value.text,
    }, header: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }).catchError(handleApiError);
    Utils.hideLoading();
    if (response == null) return Utils.showSnackBar("Failed! try again");
    getCustomer();
    Utils.showSnackBar("Customer added");
  }
}
