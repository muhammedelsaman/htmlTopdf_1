import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        //baseUrl: 'https://dummyjson.com/',
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async {
    return await dio.get(
      url,
    );
  }



  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {

    debugPrint(data.toString());

    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.post(
      url,
      data: data,
    );

  }

}
