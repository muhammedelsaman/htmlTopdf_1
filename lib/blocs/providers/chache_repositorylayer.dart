import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorge {
   late SharedPreferences _sharedPreferences;
    static final provider = Provider((ref) => LocalStorge());


   Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

   dynamic getData({
    required String key ,
  }) {
    return _sharedPreferences.get(key);
  }

   Future<void> saveData({
    required String key,
    required String value,
  }) async {

      await  _sharedPreferences.setString(key, value);

  }

   Future<bool> removeData({
    required String key,
  }) async
  {
    return  _sharedPreferences.remove(key);
  }
}
