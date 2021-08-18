import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';

class CustomerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Screen'),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Customer Screen',
            style: TextStyle(
              color: colorPrimary,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
