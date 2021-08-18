import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/local_storage/model/task.dart';
import 'package:flutter_gsg_01/local_storage/widget/new_task_widget.dart';
import 'package:flutter_gsg_01/local_storage/widget/task_widget.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void presentModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTaskWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Container(child: FutureBuilder<List<Task>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error!\n${snapshot.error.toString()}',
              ),
            );
          } else {
            List<Task> tasks = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return TaskWidget(
                  taskName: tasks[index].taskName,
                  isComplete: tasks[index].isComplete,
                  onChanged: (value) {
                    setState(() {
                      tasks[index].isComplete = !tasks[index].isComplete;
                    });
                  },
                );
              },
              itemCount: tasks.length,
            );
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          presentModalBottomSheet();
        },
      ),
    );
  }
}
