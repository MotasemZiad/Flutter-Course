import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/responsive/screen/phone_screen.dart';
import 'package:flutter_gsg_01/responsive/screen/tablet_screen.dart';

class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width <= 500
        ? PhoneScreen()
        : TabletScreen();
    // return MediaQuery.of(context).orientation == Orientation.portrait
    //     ? PhoneScreen()
    //     : TabletScreen();
  }
}
