import 'package:flutter/foundation.dart';

class Product {
  int id;
  String productName;
  String productDescription;
  double productPrice;
  int categoryId;

  Product({
    this.id,
    @required this.productName,
    @required this.productDescription,
    @required this.productPrice,
    @required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'categoryId': categoryId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      productName: map['productName'],
      productDescription: map['productDescription'],
      productPrice: map['productPrice'],
      categoryId: map['categoryId'],
    );
  }
}
