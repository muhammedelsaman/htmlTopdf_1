import 'package:covert_html_to_pdf/Models/login_model.dart';
import 'package:covert_html_to_pdf/blocs/providers/in_user_api.dart';
import 'package:covert_html_to_pdf/data/component/end_points.dart';
import 'package:covert_html_to_pdf/data/remote/dio_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserApi implements IUserApi {
  static final provider = Provider<UserApi >(
    (ref) => UserApi(),
  );
  @override
  Future<ShopLoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final loginResponse = await DioHelper.postData(
            url: EndPoint.login,
            data: {
              "email": email,
              "password": password,
            },
          );
      final json = loginResponse.data as Map<String, dynamic>;
      return ShopLoginModel.fromJson(json);
    } catch (e) {
      throw StateError('failed');
    }
  }
  @override
  Future<ShopLoginModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
}) async {
    try {
      final registerResponse = await DioHelper.postData(
        url: EndPoint.register,
        data: {
          "email": email,
          "password": password,
        },
      );
      final json = registerResponse.data as Map<String, dynamic>;
      return ShopLoginModel.fromJson(json);
    } catch (e) {
      throw StateError('failed');
    }
  }
}
