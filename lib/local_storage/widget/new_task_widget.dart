import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';

class NewTaskWidget extends StatefulWidget {
  var isChecked = false;
  final taskNameController = TextEditingController();

  @override
  _NewTaskWidgetState createState() => _NewTaskWidgetState();
}

class _NewTaskWidgetState extends State<NewTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: widget.taskNameController,
                decoration: InputDecoration(
                  hintText: 'Task Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.green.withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                ),
                cursorHeight: cursorHeight,
                onChanged: (value) => widget.taskNameController.text = value,
              ),
              Checkbox(
                value: widget.isChecked,
                onChanged: (value) => widget.isChecked = value,
              )
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Hello'),
          )
        ],
      ),
    );
  }
}
