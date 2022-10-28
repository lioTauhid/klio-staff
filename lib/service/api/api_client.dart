import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:klio_staff/service/api/api_exception.dart';

import '../../constant/value.dart';

class ApiClient {
  //GET
  Future<dynamic> get(String endPoint, {dynamic header}) async {
    var uri = Uri.parse(baseUrl + endPoint);
    try {
      var response = await http.get(uri, headers: header).timeout(Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String endPoint, dynamic payloadObj, {dynamic header}) async {
    var uri = Uri.parse(baseUrl + endPoint);
    try {
      var response =
          await http.post(uri, body: payloadObj, headers: header).timeout(Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }

  //PUT
  //DELETE

  dynamic _processResponse(http.Response response) {
    var jsonResponse = utf8.decode(response.bodyBytes);
    // print(response.statusCode);
    // print(response.body);
    switch (response.statusCode) {
      case 200:
        return jsonResponse;
      case 201:
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
