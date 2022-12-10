import 'dart:convert';
import 'package:get/get.dart';
import '../../constant/value.dart';
import '../../service/api/api_client.dart';
import '../../service/local/shared_pref.dart';
import '../../utils/utils.dart';
import '../model/kitchen_order.dart';
import 'error_controller.dart';

class KitchenController extends GetxController with ErrorController {
  Rx<KitchenOrder> kitchenOrder = KitchenOrder().obs;

  Future<void> getKitchenOrder() async {
    token = (await SharedPref().getValue('token'))!;
    Utils.showLoading();
    var response = await ApiClient()
        .get('kitchen/order', header: Utils.apiHeader)
        .catchError(handleApiError);
    kitchenOrder.value = kitchenOrderFromJson(response);
    Utils.hidePopup();
  }

  Future<bool> acceptOrder(int id, List<int> itemList, String status) async {
    var response = await ApiClient()
        .put('kitchen/$id/order',
            jsonEncode({"item_ids": itemList, "status": status}),
            header: Utils.apiHeader)
        .catchError(handleApiError);
    if (response == null) false;
    return true;
  }
}
