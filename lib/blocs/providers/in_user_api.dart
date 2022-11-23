import 'package:covert_html_to_pdf/Models/login_model.dart';
import 'package:covert_html_to_pdf/blocs/providers/user_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///////// Interface ///////
abstract class IUserApi {
  static final provider = Provider<IUserApi>(
        (ref) => UserApi(),
  );

  Future<ShopLoginModel> login ({
    required String email,
    required String password,
  });

  Future<ShopLoginModel> register ({
    required String name,
    required String email,
    required String password,
    required String phone,
});

}
