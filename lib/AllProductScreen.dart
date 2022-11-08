// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Models/data_controller.dart';

class AllProductScreen extends ConsumerWidget {
  const AllProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final GetDataFromApi productModel = ref.watch(getDataFuture);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fetch Data',
        ),
      ),
      body: productModel.listDataModel.products == null
          ? Center(child: CupertinoActivityIndicator())
          : ListView.builder(
              itemCount: productModel.listDataModel.products!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      productModel.listDataModel.products![index].title!,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    subtitle: Text(
                      productModel.listDataModel.products![index].description!,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    leading: Container(
                      alignment: Alignment.center,
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        productModel.listDataModel.products![index].id
                            .toString(),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
