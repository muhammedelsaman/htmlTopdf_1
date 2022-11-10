import 'package:dio/dio.dart';

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
    print('postData');
    print(url);
    print(data);
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.post(
      url,
      data: data,
    );
  }

  // static Future<void> getProfile() async {
  //   // User Token
  //   // String token = await _getUserToken();
  //
  //   // Http Request
  //   var _response = await dio.post('products/add',
  //       // data: _data,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //         validateStatus: (status) {
  //           return status! < 500;
  //         },
  //       ));
  //
  //   if (_response.statusCode == 200) {
  //     print(_response.data);
  //     //  return UserModel.fromJson(_response.body);
  //   } else {
  //     print('error');
  //   }
  // }

  // static Future<void> getProfile() async {
  //   // User Token
  //   // String token = await _getUserToken();
  //   late Dio dio1;
  //   dio1 = Dio(
  //     BaseOptions(
  //       baseUrl: 'https://student.valuxapps.com/api/',
  //       //baseUrl: 'https://student.valuxapps.com/api/',
  //       receiveDataWhenStatusError: true,
  //     ),
  //   );
  //   // Http Request
  //   var _response = await postData(url: 'login',
  //       data: {
  //         'email': 'mohammedelsaman@gmail.com',
  //         'password': '123456',
  //       },
  //     );
  //
  //   if (_response.statusCode == 200) {
  //     print(_response.data);
  //     //  return UserModel.fromJson(_response.body);
  //   } else {
  //     print('error');
  //   }
  // }
}
