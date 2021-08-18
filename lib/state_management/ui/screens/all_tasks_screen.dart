import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/state_management/ui/widgets/task_widget.dart';
import 'package:flutter_gsg_01/state_management/models/task_model.dart';

class AllTasksScreen extends StatelessWidget {
  final List<TaskModel> tasks;
  final Function updateTask;
  final Function deleteTask;
  AllTasksScreen({
    @required this.tasks,
    @required this.updateTask,
    @required this.deleteTask,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskWidget(
          taskModel: tasks[index],
          updateTask: updateTask,
          deleteTask: deleteTask,
        );
      },
    );
  }
}
