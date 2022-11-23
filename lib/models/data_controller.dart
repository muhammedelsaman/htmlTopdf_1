import 'package:covert_html_to_pdf/data/remote/dio_helper.dart';
import 'package:covert_html_to_pdf/models/login_model.dart';
import 'package:covert_html_to_pdf/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class DataController extends ChangeNotifier {
 static final provider =
  ChangeNotifierProvider<DataController>((ref) => DataController());


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
