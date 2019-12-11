import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

Dio buildDio(){
  var dio = Dio();
  BaseOptions options = BaseOptions();
  options.connectTimeout = 10 * 1000;
  options.receiveTimeout = 20 * 1000;
//     options.contentType = ContentType.parse('application/x-www-form-urlencoded');
  dio.options = options;
  return dio;
}

class ApiUtils{
//  static Future getRequest(String path,var parameterData) async{
  static Future getRequest(String path,{Map<String,dynamic> params}) async{
    try{
//      Response response = await dio.get(path,queryParameters: parameterData);
      Response response = await buildDio().get(path,queryParameters: params);
      return response.data;
    }catch(e){
      return print("ERROR ====> $e");
    }
  }

  static Future postRequest(String path,Map<String,dynamic> params) async{
    try {
      Response response = await buildDio().post(path,data: params);
      return response.data;
    } catch(e) {
      return print("ERROR =====> $e");
    }
  }
}