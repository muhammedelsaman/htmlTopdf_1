// ignore_for_file: avoid_print

import 'package:covert_html_to_pdf/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ProductModel.dart';

final getDataFuture =
    ChangeNotifierProvider<GetDataFromApi>((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  ProductModel listDataModel = ProductModel();

  GetDataFromApi() {
    getData();
  }

  Future getData() async {
    DioHelper.getData(url: "products").then((value) {
      // print(value.data);
      listDataModel = ProductModel.fromMap(value.data);
      print(listDataModel.products![0].title);
      notifyListeners();
    });

    //print(response!.data);
  }

  // Future postData() async {
  //   listDataModel = [];
  //   try {
  //     response = await dio.get('products');
  //     // .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //
  //     var data = jsonDecode(response!.data);
  //     for (int i = 0; i < data.length; i++) {
  //       listDataModel.add(ProductModel.fromMap(data[i]));
  //     }
  //   } catch (e) {
  //     //print(e.toString());
  //   }
  //   //notifyListeners();
  // }
}
