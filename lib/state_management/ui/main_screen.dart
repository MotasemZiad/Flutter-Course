import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/state_management/helpers/db_helper.dart';
import 'package:flutter_gsg_01/state_management/models/task_model.dart';
import 'package:flutter_gsg_01/state_management/ui/screens/all_tasks_screen.dart';
import 'package:flutter_gsg_01/state_management/ui/screens/complete_tasks_screen.dart';
import 'package:flutter_gsg_01/state_management/ui/screens/incomplete_tasks_screen.dart';
import 'package:flutter_gsg_01/state_management/ui/screens/new_task_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<TaskModel> tasks;

  insertNewTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.insertNewTask(taskModel);
    getAllTasks();
  }

  getAllTasks() async {
    tasks = await DbHelper.dbHelper.getAllTasks();
    setState(() {});
  }

  getCompleteTasks() async {
    tasks = await DbHelper.dbHelper.getCompleteTasks();
    setState(() {});
  }

  getIncompleteTasks() async {
    tasks = await DbHelper.dbHelper.getIncompleteTasks();
    setState(() {});
  }

  deleteTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.deleteTask(taskModel);
    getAllTasks();
  }

  updateTask(TaskModel taskModel) async {
    DbHelper.dbHelper.updateTask(taskModel);
    getAllTasks();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((_) => getAllTasks());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo-List'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'All Tasks',
              ),
              Tab(
                text: 'Complete Tasks',
              ),
              Tab(
                text: 'Incomplete Tasks',
              ),
            ],
            isScrollable: true,
          ),
        ),
        body: tasks == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(children: [
                AllTasksScreen(
                  tasks: tasks,
                  updateTask: updateTask,
                  deleteTask: deleteTask,
                ),
                CompleteTasksScreen(
                  tasks: tasks,
                  updateTask: updateTask,
                  deleteTask: deleteTask,
                ),
                InCompleteTasksScreen(
                  tasks: tasks,
                  updateTask: updateTask,
                  deleteTask: deleteTask,
                ),
              ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => NewTaskScreen(insertNewTask),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
