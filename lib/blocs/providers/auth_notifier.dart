import 'package:covert_html_to_pdf/Models/login_model.dart';
import 'package:covert_html_to_pdf/blocs/providers/auth_repository.dart';
import 'package:covert_html_to_pdf/data/component/end_points.dart';
import 'package:covert_html_to_pdf/data/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class LoginStates {
  LoginStates();
}

class LoginInitial extends LoginStates {
  LoginInitial();
}

class LoginLoading extends LoginStates {
  LoginLoading();
}

class LoginSuccess extends LoginStates {
  final ShopLoginModel loginModel;

  LoginSuccess(this.loginModel);
}

class LoginError extends LoginStates {
  final String error;

  LoginError(this.error);
}

class LoginNotLogged extends LoginStates {
  LoginNotLogged();
}

class AuthNotifier extends StateNotifier<LoginStates> {
  static final provider = StateNotifierProvider<AuthNotifier, LoginStates>(
      (ref) => AuthNotifier(ref.read(AuthRepository.provider)),);

  AuthNotifier(this._authRepository) : super(LoginInitial());
  final AuthRepository _authRepository;

  Future<void> check() async {

    final ShopLoginModel? loginModelCheck = await _authRepository.loginModelCheck() ;
    if (loginModelCheck != null ) {
      state = LoginSuccess(loginModelCheck);
    } else {
      state = LoginNotLogged();
    }
  }

 /* Future<void> login ({required String email, required String password}) async {

    final ShopLoginModel? loginModel =
    await _authRepository.login(email: email, password: password);

    debugPrint(loginModel.toString());

    // if (loginModel != ) {}

  }*/

   Future<void> login({
     required String email,
     required String password,
   }) async {
     try {
       state = LoginLoading();
       final loginResponse = await DioHelper.postData(url: LOGIN, data: {
         "email": email,
         "password": password,
       },);
       final json = loginResponse.data as Map<String, dynamic>;
       if (json['status'] == false) throw StateError('failed');
       final loginModel = ShopLoginModel.fromJson(json);
       _authRepository.save(loginModel);
       state = LoginSuccess(loginModel);
    } on DioError {
       state = LoginError("Couldn't fetch data. Is the device online?");
    }
   }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      state = LoginLoading();
      final loginResponse = await DioHelper.postData(url: REGISTER, data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone
      },);
      final json = loginResponse.data as Map<String, dynamic>;
      if (json['status'] == false) throw StateError('failed');
      final loginModel = ShopLoginModel.fromJson(json);
      _authRepository.save(loginModel);
      state = LoginSuccess(loginModel);
    } on DioError {
      state = LoginError("Couldn't fetch data. Is the device online?");
    }
  }

  Future<void> logout() async {
    _authRepository.delete();
    state = LoginNotLogged();
  }
  }
