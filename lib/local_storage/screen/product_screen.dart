import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/local_storage/helper/database_helper.dart';
import 'package:flutter_gsg_01/local_storage/model/category.dart';
import 'package:flutter_gsg_01/local_storage/model/product.dart';
import 'package:get_it/get_it.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              GetIt.I
                  .get<DatabaseHelper>()
                  .insertCategory(Category(name: 'Electronics'));
              //  GetIt.I
              //     .get<DatabaseHelper>().insertProduct(Product(
              //   productName: 'Laptop',
              //   productDescription: 'A new wonderful laptop',
              //   productPrice: 799.99,
              //   categoryId: 1,
              // ));
            },
            child: Text('Insert New Product')),
      ),
    );
  }
}
