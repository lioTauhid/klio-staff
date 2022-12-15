import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klio_staff/constant/value.dart';
import 'package:klio_staff/mvc/controller/error_controller.dart';
import 'package:klio_staff/mvc/model/Meal_period_model.dart';
import 'package:klio_staff/mvc/model/food_menu_addons.dart';
import 'package:klio_staff/mvc/model/food_menu_allergy.dart';
import 'package:klio_staff/mvc/model/food_menu_category_model.dart';
import 'package:klio_staff/mvc/model/food_menu_management.dart';
import 'package:klio_staff/mvc/model/food_menu_variants.dart';
import 'package:klio_staff/service/api/api_client.dart';
import 'package:klio_staff/service/local/shared_pref.dart';
import 'package:klio_staff/utils/utils.dart';

class FoodManagementController extends GetxController  with  ErrorController{
  Rx<FoodMenuManagement> menusData = FoodMenuManagement(data: []).obs;
 // RxList<FoodMenuManagementDatum> menusDataList = RxList<FoodMenuManagementDatum>();
  Rx<MealPeriod> mealPeriod = MealPeriod(data: []).obs;
  Rx<FoodMenuCategory> foodMenuCategory = FoodMenuCategory(data: []).obs;
  Rx<FoodMenuAllergy> foodMenuAllergy = FoodMenuAllergy(data: []).obs;
  Rx<FoodMenuAddons> foodAddons = FoodMenuAddons(data: []).obs;
  Rx<FoodMenuVariants> foodVariants = FoodMenuVariants(data: []).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    foodDataLoading();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> foodDataLoading()async{
    token = (await SharedPref().getValue('token'))!;
    getFoodDataList();
    getFoodMealPeriod();
    getFoodMenuCategory();
    getFoodMenuAllergy();
    getFoodMenuAddons();
    getFoodMenuVariants();
  }


 Future<void> getFoodDataList({dynamic id = ''})async{
   String endPoint = id == '' ? 'pos/menu' : 'pos/menu/$id';
   var response = await ApiClient()
       .get(endPoint, header: Utils.apiHeader)
       .catchError(handleApiError);
   menusData.value = foodMenuManagementFromJson(response);
   update();
   debugPrint("checkMenu${menusData.value.data![0].name}");
  }


  Future<void> getFoodMealPeriod({dynamic id = ''})async{
    String endPoint = id == '' ? 'food/meal-period' : 'food/meal-period/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    mealPeriod.value = mealPeriodFromJson(response);
    update();
    debugPrint("checkMilPeriod${mealPeriod.value.data[0].id}");
  }

  Future<void> getFoodMenuCategory({dynamic id = ''})async{
    String endPoint = id == '' ? 'food/category' : 'food/category/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodMenuCategory.value= foodMenuCategoryFromJson(response);
    debugPrint("checkMenuCategory${foodMenuCategory.value.data[0].isDrinks}");
  }
  Future<void> getFoodMenuAllergy({dynamic id = ''})async{
    String endPoint = id == '' ? 'food/allergy' : 'food/allergy/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodMenuAllergy.value = foodMenuAllergyFromJson(response);
    update();
    debugPrint("checkMenuAllergy${foodMenuAllergy.value.data[0].id}");
  }
  Future<void> getFoodMenuAddons({dynamic id = ''})async{
    String endPoint = id == '' ? 'food/addon' : 'food/addon/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodAddons.value = foodMenuAddonsFromJson(response);
    update();
    debugPrint("checkFoodAddons${foodAddons.value.data[0].id}");
  }

  Future<void> getFoodMenuVariants({dynamic id = ''})async{
    String endPoint = id == '' ? 'food/variant' : 'food/variant/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    debugPrint("checkFoodVariants$response");
    foodVariants.value = foodMenuVariantsFromJson(response);
    update();
    debugPrint("checkFoodVariants${foodVariants.value}");
  }




}