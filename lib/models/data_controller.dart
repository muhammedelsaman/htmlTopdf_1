import 'package:covert_html_to_pdf/data/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_model.dart';
import 'product_model.dart';

final getDataFuture =
    ChangeNotifierProvider<DataController>((ref) => DataController());

class DataController extends ChangeNotifier {
  ProductModel listDataModel = ProductModel();
  ShopLoginModel loginDataModel = ShopLoginModel();

  DataController() {
    getData();
  }

  Future getData() async {
    final data = await DioHelper.getData(url: "products");
    listDataModel = ProductModel.fromMap(data.extra);
    notifyListeners();
  }

  Future postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    final userData = await DioHelper.postData(
      url: url,
      data: data,
    );
    //listDataModel = ProductModel.fromMap(data.data);
    loginDataModel = ShopLoginModel.fromJson(userData.extra);
    notifyListeners();
  }
}
