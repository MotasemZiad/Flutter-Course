import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/local_storage/screen/tasks_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TasksScreen()));
    });
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/me.jpeg'),
              radius: 100.0,
            ),
            SizedBox(
              height: 48,
            ),
            Align(
              child: CircularProgressIndicator(),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
