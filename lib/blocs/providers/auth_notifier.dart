import 'package:covert_html_to_pdf/Models/login_model.dart';
import 'package:covert_html_to_pdf/blocs/providers/in_auth_repo.dart';
import 'package:covert_html_to_pdf/blocs/providers/in_user_api.dart';
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
    (ref) => AuthNotifier(
         ref.read(IUserApi.provider),ref.read(IAuthRepo.provider),),
  );

  AuthNotifier(this._iuserApi, this._iAuthRepo) : super(LoginInitial());
  final IUserApi _iuserApi;
  final IAuthRepo _iAuthRepo;

  Future<void> check() async {
    final ShopLoginModel? loginCheck =
        await _iAuthRepo.check();
    if (loginCheck != null) {
      state = LoginSuccess(loginCheck);
    } else {
      state = LoginNotLogged();
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = LoginLoading();
    try {
      final dataLogin = await _iuserApi.login(email: email, password: password);
      await _iAuthRepo.save(dataLogin);
      state = LoginSuccess(dataLogin);
    } catch (e) {
      state = LoginError((e as StateError).message);
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    state = LoginLoading();
    try {
      final dataRegister = await _iuserApi.register(
          name: name, email: email, password: password, phone: phone,);
      await _iAuthRepo.save(dataRegister);
      state = LoginSuccess(dataRegister);
    } catch (e) {
      state = LoginError((e as StateError).message);
    }
  }


  Future<void> logout() async {
    _iAuthRepo.delete();
    state = LoginNotLogged();
  }
}
