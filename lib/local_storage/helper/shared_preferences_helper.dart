import 'dart:convert';
import 'package:flutter_gsg_01/local_storage/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferences sharedPreferences;

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void setUsername(String username) {
    sharedPreferences.setString('username', username);
  }

  String getUsername() {
    return sharedPreferences.getString('username') ?? 'Unknown Username!!';
  }

  void setEmail(String email) {
    sharedPreferences.setString('email', email);
  }

  String getEmail() {
    return sharedPreferences.getString('email') ?? 'Unknown Email!!';
  }

  void setUser(User user) {
    sharedPreferences.setString('user', json.encode(user.toMap()));
  }
}
