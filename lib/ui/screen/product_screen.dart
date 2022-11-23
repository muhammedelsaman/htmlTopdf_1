import 'package:covert_html_to_pdf/Models/data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllProductScreen extends ConsumerWidget {
  const AllProductScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DataController productModel = ref.watch(DataController.provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fetch Data',
        ),
      ),
      body: productModel.listDataModel.products == null
          ? const Center(child: CupertinoActivityIndicator())
          : ListView.builder(
              itemCount: productModel.listDataModel.products!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      productModel.listDataModel.products![index].title!,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    subtitle: Text(
                      productModel.listDataModel.products![index].description!,
                      style: const TextStyle(fontSize: 16.0),
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
              },),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          productModel.listDataModel.products!;

          // Response r = await DioHelper.postData(
          //   url: 'login',
          //   data: {
          //     'email': 'mohammedelsaman@gmail.com',
          //     'password': '123456',
          //   },
          // );
        },
      ),
    );
  }
}
