import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:klio_staff/constant/value.dart';
import 'package:klio_staff/mvc/controller/error_controller.dart';
import 'package:klio_staff/mvc/model/Ingredient_list_model.dart';
import 'package:klio_staff/mvc/model/ingredient_category_model.dart';
import 'package:klio_staff/mvc/model/ingredient_supplier_model.dart';
import 'package:klio_staff/mvc/model/ingredient_unit_model.dart';
import 'package:klio_staff/service/api/api_client.dart';
import 'package:klio_staff/service/local/shared_pref.dart';
import 'package:klio_staff/utils/utils.dart';

class IngredientController extends GetxController with ErrorController{
  Rx<IngredinetListModel> ingredientData = IngredinetListModel(data: []).obs;
  Rx<IngredineCategoryModel> ingredientCategoryData = IngredineCategoryModel(data: []).obs;
  Rx<IngredineUnitModel> ingredientUnitData = IngredineUnitModel(data: []).obs;
  Rx<IngredineSupplierModel> ingredientSupplierData = IngredineSupplierModel(data: []).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    ingredientDataLoading();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> ingredientDataLoading()async{
    token = (await SharedPref().getValue('token'))!;
    getIngredientDataList();
    getIngredientCategory();
    getIngredientUnit();
    getIngredientSupplier();

  }




  Future<void> getIngredientDataList({dynamic id = ''})async{
    String endPoint = id == '' ? 'master/ingredient' : 'master/ingredient/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    ingredientData.value = ingredinetListModelFromJson(response);
    update();
    debugPrint("checkIngredintList${ingredientData.value.data[0].name}");
  }


  Future<void> getIngredientCategory({dynamic id = ''})async{
    String endPoint = id == '' ? 'master/ingredient-category' : 'master/ingredient-category/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    ingredientCategoryData.value = ingredineCategoryModelFromJson(response);
    update();
    debugPrint("checkIngredinetCategory${ingredientCategoryData.value.data[0].id}");
  }

  Future<void> getIngredientUnit({dynamic id = ''})async{
    String endPoint = id == '' ? 'master/ingredient-unit' : 'master/ingredient-unit/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    ingredientUnitData.value= ingredineUnitModelFromJson(response);
    update();
    debugPrint("checkIngredinetUint${ingredientUnitData.value.data[0].id}");
  }
  Future<void> getIngredientSupplier({dynamic id = ''})async{
    String endPoint = id == '' ? 'master/supplier' : 'master/supplier/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    ingredientSupplierData.value = ingredineSupplierModelFromJson(response);
    update();
    debugPrint("checkIngredinetSupplierData${ingredientSupplierData.value.data[0].id}");
  }


}