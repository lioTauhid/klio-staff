

import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:klio_staff/constant/value.dart';
import 'package:klio_staff/mvc/controller/error_controller.dart';
import 'package:klio_staff/mvc/model/expense_category_model.dart';
import 'package:klio_staff/mvc/model/expense_list_model.dart';
import 'package:klio_staff/mvc/model/purchase_list_model.dart';
import 'package:klio_staff/service/api/api_client.dart';
import 'package:klio_staff/service/local/shared_pref.dart';
import 'package:klio_staff/utils/utils.dart';

class PurchaseManagementController extends GetxController with ErrorController{
  Rx<PurchaseListModel> purchaseData = PurchaseListModel(data: []).obs;
  Rx<ExpenseDataList> expenseData = ExpenseDataList(data: []).obs;
  Rx<ExpenseCategoryModel> expenseCategoryData = ExpenseCategoryModel(data: []).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    purchaseDataLoading();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> purchaseDataLoading()async{
    token = (await SharedPref().getValue('token'))!;
    getPurchaseDataList();
    getExpenseDataList();
    getExpenseCategoryList();
  }


  Future<void> getPurchaseDataList({dynamic id = ''})async{
    String endPoint = id == '' ? 'finance/purchase' : 'finance/purchase/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    purchaseData.value = purchaseListModelFromJson(response);
    update();
    debugPrint("checkPurchaseData${purchaseData.value.data[0].id}");
  }


  Future<void> getExpenseDataList({dynamic id = ''})async{
    String endPoint = id == '' ? 'finance/expense' : 'finance/expense/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    expenseData.value = expenseDataListFromJson(response);
    update();
    debugPrint("checkExpenseData${expenseData.value.data[0].id}");
  }

  Future<void> getExpenseCategoryList({dynamic id = ''})async{
    String endPoint = id == '' ? 'finance/expense-category' : 'finance/expense-category/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    expenseCategoryData.value= expenseCategoryModelFromJson(response);
    update();
    debugPrint("checkExpenseCategoryData${expenseCategoryData.value.data[0].id}");
  }

}