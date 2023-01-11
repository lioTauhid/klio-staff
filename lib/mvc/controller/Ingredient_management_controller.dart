import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klio_staff/constant/value.dart';
import 'package:klio_staff/mvc/controller/error_controller.dart';
import 'package:klio_staff/mvc/model/Ingredient_list_model.dart';
import 'package:klio_staff/mvc/model/ingredient_category_model.dart';
import 'package:klio_staff/mvc/model/ingredient_supplier_model.dart';
import 'package:klio_staff/mvc/model/ingredient_unit_model.dart';
import 'package:klio_staff/service/api/api_client.dart';
import 'package:klio_staff/service/api/api_exception.dart';
import 'package:klio_staff/service/local/shared_pref.dart';
import 'package:klio_staff/utils/utils.dart';

class IngredientController extends GetxController with ErrorController{
  Rx<IngredinetListModel> ingredientData = IngredinetListModel(data: []).obs;
  Rx<IngredineCategoryModel> ingredientCategoryData = IngredineCategoryModel(data: []).obs;
  Rx<IngredineUnitModel> ingredientUnitData = IngredineUnitModel(data: []).obs;
  Rx<IngredineSupplierModel> ingredientSupplierData = IngredineSupplierModel(data: []).obs;



  // add Ingedinat//
  final addIngredintFormKey = GlobalKey<FormState>();
  TextEditingController addIngrediantNameCtlr=TextEditingController();
  TextEditingController addIngredientPriceCtlr=TextEditingController();
  TextEditingController addIngredintCodeCtlr=TextEditingController();
  TextEditingController addIngredintUnitCtlr=TextEditingController();


 // update ingredinat//
  final updateIngredintFormKey = GlobalKey<FormState>();
  TextEditingController updateIngrediantNameCtlr=TextEditingController();
  TextEditingController updateIngredientPriceCtlr=TextEditingController();
  TextEditingController updateIngredintCodeCtlr=TextEditingController();
  TextEditingController updateIngredintUnitCtlr=TextEditingController();

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


  // Validator
  String? Function(String?)? textValidator = (String? value) {
    if (value!.isEmpty) {
      return 'This filed is required';
    } else {
      return null;
    }
  };



  Future<void> getIngredientDataList({dynamic id = ''})async{
    String endPoint = id == '' ? 'master/ingredient' : 'master/ingredient/$id';
    var response = await ApiClient()
        .get(endPoint, header: Utils.apiHeader)
        .catchError(handleApiError);
    ingredientData.value = ingredinetListModelFromJson(response);
    update();
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


  void addAndUpdateIngrediant(bool add,String name,String price,String code, int qunatity,int categoryId,int unitId, {String id = ''}) async {
    Utils.showLoading();
    var body = jsonEncode({
      "name": name,
      "purchase_price": price,
      "category": categoryId,
      "alert_qty": qunatity,
      "unit": unitId,
      "code": code
    });
    var response;
    if (add) {
      response = await ApiClient()
          .post('master/ingredient', body, header: Utils.apiHeader)
          .catchError(handleApiError);
    } else {
      response = await ApiClient()
          .put('master/ingredient/$id', body, header: Utils.apiHeader)
          .catchError(handleApiError);
    }
    if (response == null) return;
    ingredientDataLoading();
    Utils.hidePopup();
  }
  void addAndUpdateIngrediantCategory(bool add,String name,{String id = ''}) async {
    Utils.showLoading();
    var body = jsonEncode({
      "name": name,
    });
    var response;
    if (add) {
      response = await ApiClient()
          .post('master/ingredient-category', body, header: Utils.apiHeader)
          .catchError(handleApiError);
    } else {
      response = await ApiClient()
          .put('master/ingredient-category/$id', body, header: Utils.apiHeader)
          .catchError(handleApiError);
    }
    if (response == null) return;
    ingredientDataLoading();
    Utils.hidePopup();
  }
  void addAndUpdateIngrediantUnit(bool add,String name,String description,bool status,{String id = ''}) async {
    Utils.showLoading();
    var body = jsonEncode({
      "name": name,
      "description": description,
      "status": status,
    });
    var response;
    if (add) {
      response = await ApiClient()
          .post('master/ingredient-unit', body, header: Utils.apiHeader)
          .catchError(handleApiError);
    } else {
      response = await ApiClient()
          .put('master/ingredient-unit/$id', body, header: Utils.apiHeader)
          .catchError(handleApiError);
    }
    if (response == null) return;
    ingredientDataLoading();
    Utils.hidePopup();
  }

  void addAndUpdateSupplier( bool add, String name, String email, String phone, String reference, String address, String status, File? idCardFont, File? idCardBack,{id=''}) async {
    Utils.showLoading();
    try {
      var uri = Uri.parse(baseUrl + "master/supplier");
      var responseData;
      if(add){
        http.MultipartRequest request = http.MultipartRequest('POST', uri);
        request.headers.addAll(Utils.apiHeader);
        if (idCardFont!=null) {
          http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('id_card_front', idCardFont.path);
          request.files.add(multipartFile);
        }
        if (idCardBack!=null) {
          http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('id_card_back', idCardFont!.path);
          request.files.add(multipartFile);
        }
        Map<String, String> _fields = Map();
        _fields.addAll(<String, String>{
          "name": name,
          "email": email,
          "phone": phone,
          "reference": reference,
          "address": address,
          "status": status,
        });
        request.fields.addAll(_fields);
        http.StreamedResponse response = await request.send();
        responseData = await http.Response.fromStream(response);
      }else{
        var uri = Uri.parse(baseUrl + "master/supplier/$id");
        http.MultipartRequest request = http.MultipartRequest('PUT', uri);
        request.headers.addAll(Utils.apiHeader);
        if (idCardFont!=null) {
          http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('id_card_front', idCardFont.path);
          request.files.add(multipartFile);
        }
        if (idCardBack!=null) {
          http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('id_card_back', idCardFont!.path);
          request.files.add(multipartFile);
        }
        Map<String, String> _fields = Map();
        _fields.addAll(<String, String>{
          "name": name,
          "email": email,
          "phone": phone,
          "reference": reference,
          "address": address,
          "status": status,
        });
        request.fields.addAll(_fields);
        http.StreamedResponse response = await request.send();
        responseData = await http.Response.fromStream(response);
      }
      if (responseData == null) return;
      ingredientDataLoading();
      Utils.hidePopup();
    } on SocketException {
      throw ProcessDataException("No internet connection",'');
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", '');
    }
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