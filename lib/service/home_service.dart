import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/api_service.dart';

// 获取首页banner数据
 Future getHomeRequestData() async{
   try{
     Response response;
     Dio dio = Dio();
     BaseOptions options = BaseOptions();
     options.connectTimeout = 10 * 1000;
     options.receiveTimeout = 20 * 1000;
//     options.contentType = ContentType.parse('application/x-www-form-urlencoded');
     dio.options = options;
     response = await dio.get(HOME_SERVICE_PATH['homePageBanner']);
     print('接口数据 = ' + response.data.toString());
     if(response.data['errorCode'] == 0){
       return response.data;
     } else {
       throw Exception('请求接口出现异常！');
     }
   }catch(e){
      return print('EXCEPTION =====> $e');
   }
 }

// 获取首页分类数据
Future getHomeCategoryData() async{
  try{
    Response response;
    Dio dio = Dio();
    BaseOptions options = BaseOptions();
    options.connectTimeout = 10 * 1000;
    options.receiveTimeout = 20 * 1000;
//     options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    dio.options = options;
    var requestData = {"start": 25,"count": 10,"apikey": "0df993c66c0c636e29ecbb5344252a4a"};
    response = await dio.get(HOME_SERVICE_PATH['homePageCategory'],queryParameters: requestData);
    print('接口数据 = ' + response.data.toString());
    return response.data;
  }catch(e){
    return print('EXCEPTION =====> $e');
  }
}