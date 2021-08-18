import 'package:flutter/material.dart';

class TabletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive: Tablet Screen'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
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
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'CONTENT',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontFamily: 'Aref Ruqaa',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
