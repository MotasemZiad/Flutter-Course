import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final bool isComplete;
  final Function onChanged;
  final String taskName;

  TaskWidget(
      {this.isComplete = false, @required this.taskName, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
      child: CheckboxListTile(
        value: isComplete,
        onChanged: onChanged,
        title: Text(taskName),
      ),
    );
  }
}
