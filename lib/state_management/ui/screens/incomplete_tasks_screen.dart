import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/state_management/models/task_model.dart';
import 'package:flutter_gsg_01/state_management/ui/widgets/task_widget.dart';

class InCompleteTasksScreen extends StatelessWidget {
  final List<TaskModel> tasks;
  final Function updateTask;
  final Function deleteTask;
  InCompleteTasksScreen({
    @required this.tasks,
    @required this.updateTask,
    @required this.deleteTask,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.where((element) => !element.isComplete).length,
      itemBuilder: (BuildContext context, int index) {
        return TaskWidget(
          taskModel:
              tasks.where((element) => !element.isComplete).toList()[index],
          updateTask: updateTask,
          deleteTask: deleteTask,
        );
      },
    );
  }
}
