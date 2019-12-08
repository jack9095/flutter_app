import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/api_service.dart';

// 获取首页网络数据
 Future getHomeRequestData() async{
   try{
     Response response;
     Dio dio = Dio();
     dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
     var requestParameter = {'lon':'115.02932','lat':'35.76189'};
     response = await dio.post(home_service_api['homePageContext'],data: requestParameter);
     if(response.statusCode == 200){
       return response.data;
     } else {
       throw Exception('请求接口出现异常！');
     }
   }catch(e){
      return print('EXCEPTION =====> $e');
   }
 }