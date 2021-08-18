import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';
import 'package:flutter_gsg_01/state_management/models/task_model.dart';

class NewTaskScreen extends StatelessWidget {
  String taskName;
  String taskDescription;
  final Function saveTask;

  NewTaskScreen(this.saveTask);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorPrimary,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Task Name',
                  ),
                  cursorHeight: 22.0,
                  onChanged: (value) {
                    taskName = value;
                  },
                ),
                const SizedBox(
                  height: 6.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Task Description',
                  ),
                  cursorHeight: 22.0,
                  onChanged: (value) {
                    taskDescription = value;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    saveTask(TaskModel(
                      taskName: taskName,
                      taskDescription: taskDescription,
                    ));
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
