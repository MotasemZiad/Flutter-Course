import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/state_management/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel taskModel;
  final Function updateTask;
  final Function deleteTask;
  TaskWidget({
    @required this.taskModel,
    @required this.updateTask,
    @required this.deleteTask,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Checkbox(
            value: taskModel.isComplete,
            onChanged: (value) {
              taskModel.isComplete = value;
              updateTask(taskModel);
            },
          ),
          Column(
            children: [
              Text(
                taskModel.taskName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                taskModel.taskDescription,
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => deleteTask(taskModel),
          ),
        ],
      ),
    );
  }
}
