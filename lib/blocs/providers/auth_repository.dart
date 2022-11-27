import 'dart:convert';
import 'package:covert_html_to_pdf/Models/login_model.dart';
import 'package:covert_html_to_pdf/blocs/providers/local_storge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
class AuthRepository {

  static final provider = Provider<AuthRepository>(
        (ref) => AuthRepository(ref.read(LocalStorge.provider)),);

  AuthRepository(this._localStorge);

   final LocalStorge _localStorge;

  Future<ShopLoginModel?> loginCheck() async {
    final savedData =  _localStorge.getData(
      key: 'loginData',
    );

    final model = savedData is String ? jsonDecode(savedData) : null;
    if (model is Map<String, dynamic>) {
      return ShopLoginModel.fromJson(model);
    }
    return null;
  }

  Future<void> save (ShopLoginModel loginModel) async {
    await  _localStorge.saveData(
        key: 'loginData',
        value: jsonEncode(loginModel.toJson()),
    );
  }

  Future<void> delete () async {
   _localStorge.removeData(
       key: 'loginData',
   );
  }

}
