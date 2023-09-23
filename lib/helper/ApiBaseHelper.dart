import 'dart:async';
import 'dart:convert';
import 'dart:io';

//import 'package:flutter_project/helper/errors.dart';
//import 'package:flutter_project/helper/getx_helper.dart';
//import 'package:flutter_project/helper/global_variable.dart';
//import 'package:flutter_project/helper/urls.dart';
import 'package:api_integration/helper/erroes.dart';
import 'package:api_integration/helper/getx_helper.dart';
import 'package:api_integration/helper/global_variable.dart';
import 'package:api_integration/helper/urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

//import 'package:pulse_realty/helper/errors.dart';
//import 'package:pulse_realty/helper/getx_helper.dart';
//import 'package:pulse_realty/helper/global_variables.dart';
//import 'package:pulse_realty/helper/urls.dart';

class ApiBaseHelper {
  final String baseUrl = Urls.baseURL;
  final String token = GlobalVariables.token;

  Future<dynamic> postMethod({required String url, dynamic body}) async {
    Map<String, String> header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    print('token');
    print(token);

    try {
      body = jsonEncode(body);
      print('*********************** Request ********************************');
      print(body);
      print(baseUrl + url);

      Uri urlValue = Uri.parse(baseUrl + url);
      http.Response response = await http
          .post(urlValue, headers: header, body: body)
          .timeout(const Duration(seconds: 15));

      print(response.body);

      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      print(
          '*********************** Response **********************************');
      print(urlValue.toString());
      print('body => ' + body);
      print(parsedJSON);
      print('&&&&&&&&&&&&&&&&&&&&&&& End of Response &&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJSON;
    } on SocketException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.noInternetError.tr);
      throw Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.timeOutException.tr);
      throw Errors.timeOutException;
    } on FormatException catch (e) {
      print(e);
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.formatException.tr);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.generalApiError.tr);
      throw e.toString();
    }
  }

  Future<dynamic> postMethodFormData(
      {required String url,
      required Map<String, String> fields,
      required http.MultipartFile imgFile}) async {
    try {
      print('token');
      print(token);
      print(Urls.baseURL + url);
      Uri urlValue = Uri.parse(Urls.baseURL + url);
      http.MultipartRequest request = http.MultipartRequest('POST', urlValue);
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(imgFile);

      request.fields.addAll(fields);
      http.StreamedResponse response =
          await request.send().timeout(const Duration(seconds: 15));
      Map<String, dynamic> parsedJson =
          await jsonDecode(await response.stream.bytesToString());

      print('********************** Response ********************************');
      print(fields);
      print(urlValue.toString());
      print(parsedJson.toString());
      print('&&&&&&&&&&&&&&&&&&&&&&& End of Response &&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJson;
    } on SocketException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr.tr, message: Errors.noInternetError.tr);
      throw Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr.tr, message: Errors.timeOutException.tr);
      throw Errors.timeOutException;
    } on FormatException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr.tr, message: Errors.formatException.tr);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr.tr, message: Errors.generalApiError.tr);
      throw e.toString();
    }
  }

  Future<dynamic> postMethodImagesFormData(
      {required String url,
      required List<http.MultipartFile> filesList}) async {
    try {
      print('token');
      print(token);
      print(Urls.baseURL + url);
      Uri urlValue = Uri.parse(Urls.baseURL + url);
      http.MultipartRequest request = http.MultipartRequest('POST', urlValue);
      request.headers['Authorization'] = 'Bearer $token';
      request.files.addAll(filesList);
      http.StreamedResponse response =
          await request.send().timeout(const Duration(seconds: 15));
      Map<String, dynamic> parsedJson =
          await jsonDecode(await response.stream.bytesToString());

      print('********************** Response ********************************');
      print(filesList);
      print(urlValue.toString());
      print(parsedJson.toString());
      print('&&&&&&&&&&&&&&&&&&&&&&& End of Response &&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJson;
    } on SocketException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr.tr, message: Errors.noInternetError.tr);
      throw Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.timeOutException.tr);
      throw Errors.timeOutException;
    } on FormatException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.formatException.tr);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.generalApiError.tr);
      throw e.toString();
    }
  }

  Future<dynamic> getMethod({required String url}) async {
    Map<String, String> header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      print('token');
      print(token);
      Uri urlValue = Uri.parse(url);
      //Uri urlValue = Uri.parse(baseUrl + url);
      print(urlValue);
      http.Response response = await http
          .get(urlValue, headers: header)
          .timeout(const Duration(seconds: 15));

      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      print(
          '*********************** Response **********************************');
      print(urlValue.toString());
      print(parsedJSON);
      print('&&&&&&&&&&&&&&&&&&&&&&& End of Response &&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJSON;
    } on SocketException {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.noInternetError.tr);
      throw Errors.noInternetError;
    } on TimeoutException {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.timeOutException.tr);
      throw Errors.timeOutException + url;
    } on FormatException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.formatException.tr);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(
          title: 'Error'.tr, message: Errors.generalApiError.tr);
      throw e.toString();
    }
  }
}
