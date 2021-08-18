import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive: Phone Screen'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 36.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/me.jpeg'),
              ),
              accountName: Text('Motasem Z. Abu Nema'),
              accountEmail: Text('miziad2000@gmail.com'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.home),
              title: Text('Home'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.person),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        ),
      ),
      body: Container(
        width: 300,
        color: Colors.red,
        child: Text(
          'Hello world!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
