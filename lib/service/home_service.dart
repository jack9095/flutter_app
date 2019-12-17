import 'package:dio/dio.dart';
import 'dart:async';
import '../config/api_service.dart';
import '../util/Api_service_util.dart';

// 获取首页banner数据
Future getHomeRequestData() async {
  try {
    Response response;
    response = await buildDio().get(HOME_SERVICE_PATH['homePageBanner']);
    print('接口数据 = ' + response.data.toString());
    if (response.data['errorCode'] == 0) {
      return response.data;
    } else {
      throw Exception('请求接口出现异常！');
    }
  } catch (e) {
    return print('EXCEPTION ===== 获取首页banner数据 > $e');
  }
}

// 获取首页分类数据
Future getHomeCategoryData() async {
  try {
    Response response;
    var requestData = {
      "start": 25,
      "count": 20,
      "apikey": "0df993c66c0c636e29ecbb5344252a4a"
    };
    response = await buildDio().get(HOME_SERVICE_PATH['homePageCategory'], queryParameters:requestData);
    print('获取首页分类数据接口数据 = ' + response.data.toString());
    return response.data;
  } catch (e) {
    return print('EXCEPTION ===== 获取首页分类数据 > $e');
  }
}

// 获取首页列表
Future getHomeList(String page) async{
  try{
    Response response = await buildDio().get(HOME_SERVICE_PATH['homeList']+page);
    print('获取首页列表接口数据 = ' + response.data.toString());
    return response.data;
  }catch(e){
    return print("ERROR 获取首页列表接口数据 ===== > $e");
  }
}
