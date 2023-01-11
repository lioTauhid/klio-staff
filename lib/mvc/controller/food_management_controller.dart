import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klio_staff/constant/value.dart';
import 'package:klio_staff/mvc/controller/error_controller.dart';
import 'package:klio_staff/mvc/model/Ingredient_list_model.dart';
import 'package:klio_staff/mvc/model/Meal_period_model.dart';
import 'package:klio_staff/mvc/model/Single_display_category_details.dart';
import 'package:klio_staff/mvc/model/Single_meal_allergy_details.dart';
import 'package:klio_staff/mvc/model/food_menu_addons.dart';
import 'package:klio_staff/mvc/model/food_menu_allergy.dart';
import 'package:klio_staff/mvc/model/food_menu_category_model.dart';
import 'package:klio_staff/mvc/model/food_menu_details_single_item.dart';
import 'package:klio_staff/mvc/model/food_menu_management.dart';
import 'package:klio_staff/mvc/model/food_menu_sigle_meal_addons.dart';
import 'package:klio_staff/mvc/model/food_menu_single_variant_details.dart';
import 'package:klio_staff/mvc/model/food_menu_variants.dart';
import 'package:klio_staff/mvc/model/single_meal_period_tetails.dart';
import 'package:klio_staff/service/api/api_client.dart';
import 'package:klio_staff/service/api/api_exception.dart';
import 'package:klio_staff/service/local/shared_pref.dart';
import 'package:klio_staff/utils/utils.dart';

class FoodManagementController extends GetxController with ErrorController {


  /// Api data fetch variable
  Rx<FoodMenuManagement> menusData = FoodMenuManagement(data: []).obs;
  Rx<MealPeriod> mealPeriod = MealPeriod(data: []).obs;
  Rx<FoodMenuCategory> foodMenuCategory = FoodMenuCategory(data: []).obs;
  Rx<FoodMenuAllergy> foodMenuAllergy = FoodMenuAllergy(data: []).obs;
  Rx<FoodMenuAddons> foodAddons = FoodMenuAddons(data: []).obs;
  Rx<FoodMenuVariants> foodVariants = FoodMenuVariants(data: []).obs;
  Rx<IngredinetListModel> ingredientData = IngredinetListModel(data: []).obs;
  Rx<FooodMenueDetailsSingleItem> foodSingleItemDetails = FooodMenueDetailsSingleItem().obs;
  Rx<SingleMealPeriodDetails> singleMealPeriodDetails = SingleMealPeriodDetails().obs;
  Rx<SingleDisplayCategoryDetaiils> singleMealCategoryDetails = SingleDisplayCategoryDetaiils().obs;
  Rx<SingleDisplayAllergyDetails> singleMealAllergyDetails = SingleDisplayAllergyDetails().obs;
  Rx<SingleMealAddons> singleMealAddonsDetails = SingleMealAddons().obs;
  Rx<SingleVariantDetails> singleVariantDetails = SingleVariantDetails().obs;





  // temp variable upload
  List<int> uploadMealPeriodIdList = [];
  List<int> uploadMenuCategoryIdList = [];
  List<int>  uploadMenuAddonsIdList=[];
  List<int> uploadMenuAllergyIdList=[];
  List<int> uploadMenuIngredientIdList=[];
  List<int> selectMenuItem=[];


  // temp variable update
  List<int> updateMealPeriodIdList = [];
  List<int> updateMenuCategoryIdList = [];
  List<int> updateMenuAddonsIdList=[];
  List<int> updateMenuAllergyIdList=[];
  List<int> updateMenuIngredientIdList=[];
  List<int> updateMenuItem=[];

  //update temp variable



  /// upload menu
  final uploadMenuFormKey = GlobalKey<FormState>();
  final updateMenuFormKey = GlobalKey<FormState>();
  File? menuStoreImage;
  File? menuUpdateImage;
  TextEditingController nameTextCtlr = TextEditingController();
  TextEditingController nameUpdateTextCtlr = TextEditingController();
  TextEditingController varinetPriceEditingCtlr = TextEditingController();
  TextEditingController varinetUpdatePricEditingCtlr = TextEditingController();
  TextEditingController vatEditingCtlr = TextEditingController();
  TextEditingController vatUpdateEditingCtlr = TextEditingController();
  TextEditingController processTimeEditingCtlr = TextEditingController();
  TextEditingController processTimeUpdateEditingCtlr = TextEditingController();
  TextEditingController variantNameEditingCtlr = TextEditingController();
  TextEditingController caloriesEditingCtlr = TextEditingController();
  TextEditingController caloriesUpdateEditingCtlr = TextEditingController();
  TextEditingController descriptionEditingCtlr = TextEditingController();
  TextEditingController descriptionUpdateEditingCtlr = TextEditingController();
  List<SingleMenuDetailsData> updateMealIngrediantSelectMeal=[];
  RxBool isDrinks = false.obs;
  RxString currentSelectedValue = ''.obs;


  /// Meal period
  File? mealPeriodStoreImage;
  File? mealPeriodUpdateStoreImage;
  final uploadMealPeriodKey = GlobalKey<FormState>();
  final updateMealPeriodKey = GlobalKey<FormState>();
  TextEditingController mealPeriodTextCtlr = TextEditingController();
  TextEditingController mealPeriodUpdateTextCtlr = TextEditingController();
  // RxBool mealPeriodAddIsDrinks = false.obs;
  // RxBool mealPeriodUpdateIsDrinks = false.obs;

  /// meal category
  File? mealCategoryStoreImage;
  File? mealCategoryUpdateStoreImage;
  final uploadMealCategoryKey = GlobalKey<FormState>();
  final updateMealCategoryKe=GlobalKey<FormState>();
  TextEditingController mealCategoryTextCtlr = TextEditingController();
  TextEditingController mealCategoryUpdateTextCtlr = TextEditingController();


  /// Meal allergy
  File? mealAllergyStoreImage;
  File? mealAllergyUpdateImage;
  final uploadMealAllergyKey = GlobalKey<FormState>();
  final updateMealAllergyKey = GlobalKey<FormState>();
  TextEditingController mealAllergyTextCtlr = TextEditingController();
  TextEditingController mealAllergyUpdateTextCtlr = TextEditingController();


  /// Meal addons
  File? mealAddonsStoreImage;
  File? updateMealAddonsStoreImage;
  final uploadMealAddonsKey = GlobalKey<FormState>();
  final updateMealAddonsKey = GlobalKey<FormState>();
  TextEditingController mealAddonsNameTextCtlr = TextEditingController();
  TextEditingController udpateMealAddonsNameTextCtlr = TextEditingController();
  TextEditingController mealAddonsPriceTextCtlr = TextEditingController();
  TextEditingController updateMealAddonsPriceTextCtlr = TextEditingController();
  TextEditingController mealAddonsDetailsTextCtlr = TextEditingController();
  TextEditingController updateMealAddonsDetailsTextCtlr = TextEditingController();


  /// Meal variants
  final uploadMealVariantsKey = GlobalKey<FormState>();
  final updateMealVariantsKey = GlobalKey<FormState>();
  TextEditingController uploadMealVariantsNameTextCtlr = TextEditingController();
  TextEditingController updateMealVariantsNameTextCtlr = TextEditingController();
  TextEditingController uploadMealVariantsPriceTextCtlr = TextEditingController();
  TextEditingController updateMealVariantsPriceTextCtlr = TextEditingController();
   List<SinlgeVariantData> updateSelectedVariant=[];
  List<int> updateSelectVariantMenuItem=[];



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

  Future<void> foodDataLoading() async {
    token = (await SharedPref().getValue('token'))!;
    debugPrint('checkToken\n$token');
    getIngredientDataList();
    getFoodDataList();
    getFoodMealPeriod();
    getFoodMenuCategory();
    getFoodMenuAllergy();
    getFoodMenuAddons();
    getFoodMenuVariants();
  }


  // Validator
  String? Function(String?)? textValidator = (String? value) {
    if (value!.isEmpty) {
      return 'This filed is required';
    } else {
      return null;
    }
  };

  Future<File> getImage() async {
    File ?imageFile;
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
     File menuStoreImage = File(pickedFile.path);
      imageFile=menuStoreImage;
      update();
    } else {
      print('No image selected.');
    }
    return imageFile!;
  }

  Future<void> getFoodDataList({dynamic id = ''}) async {
    String endPoint = id == '' ? 'food/menu' : 'food/menu/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    menusData.value = foodMenuManagementFromJson(response);
    update();
  }

  Future<void> getFoodMealPeriod({dynamic id = ''}) async {
    String endPoint ='food/meal-period/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    print('check meal period${response}');
    mealPeriod.value = mealPeriodFromJson(response);
    update();
    // print('check meal period${mealPeriod.value.data!.length}');
  }

  Future<void> getFoodMenuCategory({dynamic id = ''}) async {
    String endPoint = id == '' ? 'food/category' : 'food/category/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodMenuCategory.value = foodMenuCategoryFromJson(response);
    update();
  }

  Future<void> getFoodMenuAllergy({dynamic id = ''}) async {
    String endPoint = id == '' ? 'food/allergy' : 'food/allergy/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodMenuAllergy.value = foodMenuAllergyFromJson(response);
    update();
  }

  Future<void> getFoodMenuAddons({dynamic id = ''}) async {
    String endPoint = id == '' ? 'food/addon' : 'food/addon/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodAddons.value = foodMenuAddonsFromJson(response);
    update();
  }

  Future<void> getFoodMenuVariants({dynamic id = ''}) async {
    String endPoint = id == '' ? 'food/variant' : 'food/variant/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    //  debugPrint("checkFoodVariants$response");
    foodVariants.value = foodMenuVariantsFromJson(response);
    update();
    // debugPrint("checkFoodVariants${foodVariants.value}");
  }


  Future<void> getIngredientDataList({dynamic id = ''})async{
    String endPoint = id == '' ? 'master/ingredient' : 'master/ingredient/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    ingredientData.value = ingredinetListModelFromJson(response);
    update();
  }

  void addMenu(
    String name,
    String price,
    String processingTime,
    String vatTax,
    String calories,
    String description,
    String ingredient,
    List<int> mealPeriods,
    List<int> addons,
    List<int> allergies,
    List<int> categories,
  ) async {
    Utils.showLoading();
    var uri = Uri.parse(baseUrl + "food/menu");
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(Utils.apiHeader);
      if (menuStoreImage != null) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('image', menuStoreImage!.path);
        request.files.add(multipartFile);
      }
      for (int i = 0; i < mealPeriods.length; i++) {
        request.fields['meal_periods[$i]'] = '${mealPeriods[i]}';
      }
      for (int i = 0; i < addons.length; i++) {
        request.fields['addons[$i]'] = '${addons[i]}';
      }
      for (int i = 0; i < allergies.length; i++) {
        request.fields['allergies[$i]'] = '${allergies[i]}';
      }
      for (int i = 0; i < categories.length; i++) {
        request.fields['categories[$i]'] = '${categories[i]}';
      }
      Map<String, String> _fields = Map();
      _fields.addAll(<String, String>{
        "name": name,
        "price": price,
        "processing_time": processingTime,
        "tax_vat": vatTax,
        "calorie": calories,
        "description": description,
        "ingredient_name": ingredient,
      });
      request.fields.addAll(_fields);
      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      Utils.hidePopup();
      Get.back();
      _processResponse(res);
      foodDataLoading();
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }

  void updateMenu(
      String name,
      String price,
      String processingTime,
      String vatTax,
      String calories,
      String description,
      String ingredient,
      List<int> mealPeriods,
      List<int> addons,
      List<int> allergies,
      List<int> categories,
      {dynamic id=''}
      ) async {
    Utils.showLoading();
    var uri = Uri.parse(baseUrl + "food/menu$id");
    try {
      http.MultipartRequest request = http.MultipartRequest('PATCH', uri);
      request.headers.addAll(Utils.apiHeader);
      if (menuUpdateImage != null) {
        http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', menuUpdateImage!.path);
        request.files.add(multipartFile);
      }
      for (int i = 0; i < mealPeriods.length; i++) {
        request.fields['meal_periods[$i]'] = '${mealPeriods[i]}';
      }
      for (int i = 0; i < addons.length; i++) {
        request.fields['addons[$i]'] = '${addons[i]}';
      }
      for (int i = 0; i < allergies.length; i++) {
        request.fields['allergies[$i]'] = '${allergies[i]}';
      }
      for (int i = 0; i < categories.length; i++) {
        request.fields['categories[$i]'] = '${categories[i]}';
      }
      Map<String, String> _fields = Map();
      _fields.addAll(<String, String>{
        "name": name,
        "price": price,
        "processing_time": processingTime,
        "tax_vat": vatTax,
        "calorie": calories,
        "description": description,
        "ingredient_name": ingredient,
      });
      request.fields.addAll(_fields);
      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      Utils.hidePopup();
      Get.back();
      _processResponse(res);
      foodDataLoading();
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }



  void addMealPeriod(String name, File? image) async {
    Utils.showLoading();
    var uri = Uri.parse(baseUrl + "food/meal-period");
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(Utils.apiHeader);
      if (image != null) {
        http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', image.path);
        request.files.add(multipartFile);
      }
      Map<String, String> _fields = Map();
      _fields.addAll(<String, String>{
        "name": name,
      });
      request.fields.addAll(_fields);
      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      Utils.hidePopup();
      Get.back();
      _processResponse(res);
      foodDataLoading();
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }
  void UpdateMealPeriod(String name,{ dynamic id = ''}) async {
    Utils.showLoading();
    var uri = Uri.parse(baseUrl + "food/meal-period$id");
    try {
      http.MultipartRequest request = http.MultipartRequest('PATCH', uri);
      request.headers.addAll(Utils.apiHeader);
      if (mealPeriodUpdateStoreImage != null) {
        http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', mealPeriodUpdateStoreImage!.path);
        request.files.add(multipartFile);
      }
      Map<String, String> _fields = Map();
      _fields.addAll(<String, String>{
        "name": name,
      });
      request.fields.addAll(_fields);
      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      Utils.hidePopup();
      Get.back();
      print('chekOurMessage${res.body}');
      _processResponse(res);
      foodDataLoading();
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }
  void addMealCategory(String name, File? image) async {
    Utils.showLoading();
    var uri = Uri.parse(baseUrl + "food/category");
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(Utils.apiHeader);
      if (image != null) {
        http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', image.path);
        request.files.add(multipartFile);
      }
      Map<String, String> _fields = Map();
      _fields.addAll(<String, String>{
        "name": name,
      });
      request.fields.addAll(_fields);
      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      Utils.hidePopup();
      Get.back();
      _processResponse(res);
      foodDataLoading();
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }
  void updateMealCategory(String name, {dynamic id=''}) async {
    Utils.showLoading();
    var uri = Uri.parse(baseUrl + "food/category$id");
    try {
      http.MultipartRequest request = http.MultipartRequest('PUT', uri);
      request.headers.addAll(Utils.apiHeader);
      if (mealCategoryUpdateStoreImage != null) {
        http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', mealCategoryUpdateStoreImage!.path);
        request.files.add(multipartFile);
      }
      Map<String, String> _fields = Map();
      _fields.addAll(<String, String>{
        "name": name,
      });
      request.fields.addAll(_fields);
      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      Utils.hidePopup();
      Get.back();
      _processResponse(res);
      foodDataLoading();
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }
  void addMealAllergy(String name, File? image) async {
    Utils.showLoading();
    var uri = Uri.parse(baseUrl + "food/allergy");
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(Utils.apiHeader);
      if (image != null) {
        http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', image.path);
        request.files.add(multipartFile);
      }
      Map<String, String> _fields = Map();
      _fields.addAll(<String, String>{
        "name": name,
      });
      request.fields.addAll(_fields);
      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      Utils.hidePopup();
      Get.back();
      _processResponse(res);
      foodDataLoading();
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }

  void updateMealAllergy(String name, {id=''}) async {
    Utils.showLoading();
    var uri = Uri.parse(baseUrl + "food/allergy$id");
    try {
      http.MultipartRequest request = http.MultipartRequest('PUT', uri);
      request.headers.addAll(Utils.apiHeader);
      if (mealAllergyUpdateImage != null) {
        http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', mealAllergyUpdateImage!.path);
        request.files.add(multipartFile);
      }
      Map<String, String> _fields = Map();
      _fields.addAll(<String, String>{
        "name": name,
      });
      request.fields.addAll(_fields);
      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      Utils.hidePopup();
      Get.back();
      _processResponse(res);
      foodDataLoading();
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }
  void deleteMealAllergy({id=''}) async {
    Utils.showLoading();
    String endPoint = 'food/allergy/$id';
    var response = await ApiClient()
        .delete(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodDataLoading();
    Utils.hidePopup();
  }


  void addMealAddons(String name,String price,String details, File? image) async {
    Utils.showLoading();
    var uri = Uri.parse(baseUrl + "food/addon");
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(Utils.apiHeader);
      if (image != null) {
        http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', image.path);
        request.files.add(multipartFile);
      }
      Map<String, String> _fields = Map();
      _fields.addAll(<String, String>{
        "name": name,
        "price": price,
        "details": details,
      });
      request.fields.addAll(_fields);
      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      Utils.hidePopup();
      Get.back();
      _processResponse(res);
      foodDataLoading();
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }
  void updateMealAddons(String name,String price,String details,{id=''}) async {
    Utils.showLoading();
    var uri = Uri.parse(baseUrl + "food/addon/$id");
    try {
      http.MultipartRequest request = http.MultipartRequest('PUT', uri);
      request.headers.addAll(Utils.apiHeader);
      if (updateMealAddonsStoreImage != null) {
        http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', updateMealAddonsStoreImage!.path);
        request.files.add(multipartFile);
      }
      Map<String, String> _fields = Map();
      _fields.addAll(<String, String>{
        "name": name,
        "price": price,
        "details": details,
      });
      request.fields.addAll(_fields);
      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      Utils.hidePopup();
      Get.back();
      _processResponse(res);
      foodDataLoading();
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }
  void deleteMealAddons({id=''}) async {
    Utils.showLoading();
    String endPoint = 'food/addon/$id';
    var response = await ApiClient()
        .delete(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodDataLoading();
    Utils.hidePopup();
  }



  void addMenuVariant(int selectedMenu, String variantName,String variantPrice) async {
    Utils.showLoading();
    var body = jsonEncode({
      "menu": selectedMenu.toString(),
      "name": variantName,
      "price": variantPrice,
    });
    var  response = await ApiClient()
        .post('food/variant', body, header: Utils.apiHeader)
        .catchError(handleApiError);
    Utils.hidePopup();
    Get.back();
    if (response == null) return;
    foodDataLoading();
    Utils.showSnackBar("Customer added successfully");
  }
  void updateVariant(int selectedMenu, String variantName,String variantPrice,{dynamic id=''}) async {
    Utils.showLoading();
    var body = jsonEncode({
      "menu": selectedMenu.toString(),
      "name": variantName,
      "price": variantPrice,
    });
    var  response = await ApiClient()
        .put('food/variant$id', body, header: Utils.apiHeader)
        .catchError(handleApiError);
    Utils.hidePopup();
    Get.back();
    if (response == null) return;
    foodDataLoading();
    Utils.showSnackBar("Customer added successfully");
  }

  void deleteVariant({id=''}) async {
    Utils.showLoading();
    String endPoint = 'food/variant/$id';
    var response = await ApiClient()
        .delete(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodDataLoading();
    Utils.hidePopup();
  }


  Future<void> getSingleMenuDetails({dynamic id = ''})async{
    String endPoint = 'food/menu/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodSingleItemDetails.value = fooodMenueDetailsSingleItemFromJson(response);
    update();
    print('checkResponseDetails${foodSingleItemDetails.value.data!.name!}');
  }

  Future<void> deleteMenu({dynamic id = ''})async{
    Utils.showLoading();
    String endPoint = 'food/menu/$id';
    var response = await ApiClient()
        .delete(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodDataLoading();
    Utils.hidePopup();
  }
  Future<void> deleteMealPeriod({dynamic id = ''})async{
    Utils.showLoading();
    String endPoint = 'food/meal-period/$id';
    var response = await ApiClient()
        .delete(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodDataLoading();
    Utils.hidePopup();
  }



  Future<void> deleteMealCategory({dynamic id = ''})async{
    Utils.showLoading();
    String endPoint = 'food/category/$id';
    var response = await ApiClient()
        .delete(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    foodDataLoading();
    Utils.hidePopup();
  }

  Future<void> getSinleMelaPeriodDetails({dynamic id = ''})async{
    String endPoint = 'food/meal-period/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
  //  print('mealPeriod Details1${response}');
    singleMealPeriodDetails.value = singleMealPeriodDetailsFromJson(response);
    update();
  }

  Future<void> getSinleMealCategoryDetails({dynamic id = ''})async{
    String endPoint = 'food/category/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    singleMealCategoryDetails.value = singleDisplayCategoryDetaiilsFromJson(response);
    update();
  }


  Future<void> getSinleMealAllergyDetails({dynamic id = ''})async{
    String endPoint = 'food/allergy/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    singleMealAllergyDetails.value = singleDisplayAllergyDetailsFromJson(response);
    update();
  }
  Future<void> getSinleMealAdddonsDetails({dynamic id = ''})async{
    String endPoint = 'food/addon/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    singleMealAddonsDetails.value = singleMealAddonsFromJson(response);
    update();
  }

  Future<void> getSinleVariantDetails({dynamic id = ''})async{
    updateSelectedVariant.clear();
    String endPoint = 'food/variant/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    singleVariantDetails.value = singleVariantDetailsFromJson(response);
   // updateSelectedVariant.add(singleVariantDetails.value.data!);
    update();
  }


  dynamic _processResponse(http.Response response) {
    var jsonResponse = utf8.decode(response.bodyBytes);
    print('check body response${response.body}');
    var jsonDecode=json.decode(response.body);
    Utils.showSnackBar(jsonDecode['message']);
    print(response.statusCode);
    print(response.request!.url);
    switch (response.statusCode) {
      case 200:
        return jsonResponse;
      case 201:
        return jsonResponse;
      case 422:
        return jsonResponse;
      case 400:
        throw BadRequestException(
            jsonResponse, response.request!.url.toString());
      case 500:
        throw BadRequestException(
            jsonResponse, response.request!.url.toString());
      default:
        throw ProcessDataException(
            "Error occurred with code ${response.statusCode}",
            response.request!.url.toString());
    }
  }
}
