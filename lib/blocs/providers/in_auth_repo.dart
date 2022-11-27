import 'package:covert_html_to_pdf/Models/login_model.dart';
import 'package:covert_html_to_pdf/blocs/providers/auth_repository.dart';
import 'package:covert_html_to_pdf/blocs/providers/local_storge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//// InterFace ---
abstract class IAuthRepo {

  static final provider =
      Provider<IAuthRepo>((ref) => AuthRepository(ref.read(LocalStorge.provider)));

  Future<ShopLoginModel?> check();

  Future<void> save(ShopLoginModel loginModel);

  Future<void> delete();
}
