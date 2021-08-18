import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/form/screen/form3_screen.dart';
import 'package:flutter_gsg_01/navigation/auth/model/user.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  HomeScreen([this.user]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text(
            //   user.userType == UserType.Customer
            //       ? 'Hi, I\'m a Customer\nMy email is ${user.email}\nMy phone is ${user.phone}'
            //       : 'Hi, I\'m a Merchant\nMy shop name is ${user.shopName}\nIt\'s place is in ${user.shopAddress}\nBio => ${user.bio}',
            //   style: TextStyle(
            //     color: Colors.grey,
            //     fontSize: 16.0,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
