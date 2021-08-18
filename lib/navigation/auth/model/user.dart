import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/form/screen/form3_screen.dart';
import 'package:flutter_gsg_01/navigation/auth/screen/customer_screen.dart';
import 'package:flutter_gsg_01/navigation/auth/screen/merchant_screen.dart';
import 'package:flutter_gsg_01/navigation/router/router.dart';

class User {
  UserType userType;
  String username;
  String email;
  String phone;
  String password;
  String shopName;
  String bio;
  String category;
  String shopAddress;

  User.customer({
    @required this.username,
    this.email,
    @required this.password,
    this.phone,
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

  User.fromUserType(UserType userType) {
    if (userType == UserType.Customer) {
      AppRouter.router.navigateTo('/customer');
    } else if (userType == UserType.Merchant) {
      AppRouter.router.navigateTo('/merchant');
    }
  }
}
