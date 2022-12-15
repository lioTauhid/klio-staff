import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:klio_staff/constant/value.dart';
import 'package:klio_staff/mvc/controller/error_controller.dart';
import 'package:klio_staff/mvc/model/bank_list_data_model.dart';
import 'package:klio_staff/mvc/model/transaction_list_data_model.dart';
import 'package:klio_staff/service/api/api_client.dart';
import 'package:klio_staff/service/local/shared_pref.dart';
import 'package:klio_staff/utils/utils.dart';

class TransactionsController extends GetxController with ErrorController{
  Rx<BankListModel> bankListData = BankListModel(data: []).obs;
  Rx<TransactionListModel> transactionListData = TransactionListModel(data: []).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    transactionsDataLoading();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> transactionsDataLoading()async{
    token = (await SharedPref().getValue('token'))!;
    bankListDataList();
    transactionDataList();

  }

  Future<void> bankListDataList({dynamic id = ''})async{
    String endPoint = id == '' ? 'finance/bank' : 'finance/bank/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
   // debugPrint("checkBankList$response");
    bankListData.value = bankListModelFromJson(response);
    update();
    debugPrint("checkBankList${bankListData.value.data[0].name}");
  }


  Future<void> transactionDataList({dynamic id = ''})async{
    String endPoint = id == '' ? 'finance/bank-transaction' : 'finance/bank-transaction/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
   // debugPrint("checkTransactionList${response}");
    transactionListData.value = transactionListModelFromJson(response);
    update();
    debugPrint("checkTransactionList${transactionListData.value.data[0].id}");
  }

}