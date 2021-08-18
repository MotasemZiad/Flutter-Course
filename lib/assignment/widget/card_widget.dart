import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/model/vehicle.dart';

class CardWidget extends StatelessWidget {
  final Vehicle vehicle;
  CardWidget(this.vehicle);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(
              vehicle.icon,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(vehicle.name),
          ],
        ),
      ),
    );
  }
}
