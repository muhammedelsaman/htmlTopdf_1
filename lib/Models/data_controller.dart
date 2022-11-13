import 'package:covert_html_to_pdf/data/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_model.dart';
import 'product_model.dart';

final getDataFuture =
    ChangeNotifierProvider<GetDataFromApi>((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  ProductModel listDataModel = ProductModel();
  ShopLoginModel loginModel = ShopLoginModel();

  GetDataFromApi() {
    getData();
  }

  Future getData() async {
    final data = await DioHelper.getData(url: "products");
    listDataModel = ProductModel.fromMap(data.data);
    notifyListeners();
  }

  Future postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    final response = await DioHelper.postData(
      url: url,
      data: data,
    );
    //listDataModel = ProductModel.fromMap(data.data);
    loginModel = ShopLoginModel.fromJson(response.data);
    notifyListeners();
  }
}
