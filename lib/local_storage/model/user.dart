import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/navigation/auth/screen/register_screen.dart';

class User {
  String username;
  String password;
  String shopName;
  String shopAddress;
  String bio;
  String category;
  UserType userType;

  User.customer({
    @required this.username,
    @required this.password,
    this.userType = UserType.Customer,
  });

  User.merchant({
    @required this.username,
    @required this.password,
    this.bio,
    this.category,
    this.shopName,
    this.shopAddress,
    this.userType = UserType.Merchant,
  });

  Map<String, Object> toMap() {
    return this.userType == UserType.Customer
        ? {
            'username': this.username,
            'password': this.password,
          }
        : {
            'username': this.username,
            'password': this.password,
            'shopName': this.shopName,
            'shopAddress': this.shopAddress,
            'bio': this.bio,
            'category': this.category,
          };
  }
}
