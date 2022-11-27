import 'dart:convert';
import 'package:covert_html_to_pdf/Models/login_model.dart';
import 'package:covert_html_to_pdf/blocs/providers/in_auth_repo.dart';
import 'package:covert_html_to_pdf/blocs/providers/local_storge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// static final provider = Provider<AuthRepository>(
//       (ref) => AuthRepository(ref.read(LocalStorge.provider)),);
//
// AuthRepository(this._localStorge);
//
//  final LocalStorge _localStorge;


class AuthRepository implements IAuthRepo {
  static final provider = Provider<AuthRepository>(
    (ref) => AuthRepository(ref.read(LocalStorge.provider)),
  );

  AuthRepository(this._localStorge);

  final LocalStorge _localStorge;

  @override
  Future<ShopLoginModel?> check() async {
    final savedData = _localStorge.getData(
      key: 'loginData',
    );
    final model = savedData is String ? jsonDecode(savedData) : null;
    if (model is Map<String, dynamic>) {
      return ShopLoginModel.fromJson(model);
    }
    return null;
  }

  @override
  Future<void> save(ShopLoginModel loginModel) async {
    await  _localStorge.saveData(
              key: 'loginData',
              value: jsonEncode(loginModel.toJson()),
          );
  }

  @override
  Future<void> delete() async {
    _localStorge.removeData(key: 'loginData',);
  }

}
