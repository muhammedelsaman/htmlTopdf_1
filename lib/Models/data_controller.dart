import 'package:covert_html_to_pdf/data/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_model.dart';

final getDataFuture =
    ChangeNotifierProvider<GetDataFromApi>((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  ProductModel listDataModel = ProductModel();

  GetDataFromApi() {
    getData();
  }

  // Future getData() async {
  //   DioHelper.getData(url: "products").then((value) {
  //     listDataModel = ProductModel.fromMap(value.data);
  //     notifyListeners();
  //   });
  // }
  Future getData() async {
    final data = await DioHelper.getData(url: "products");
    listDataModel = ProductModel.fromMap(data.data);
    notifyListeners();
  }
}
