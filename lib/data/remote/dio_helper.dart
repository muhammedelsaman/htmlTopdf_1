import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin  DioHelper {
  static  Dio dio=Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<Response> getData({
    required String url,
  }) async {
    return  dio.get(
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

    return  dio.post(
      url,
      data: data,
    );

  }

}
