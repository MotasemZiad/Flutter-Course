class Task {
  int id;
  String taskName;
  bool isComplete;

  Task({this.id, this.taskName, this.isComplete = false});

/*
  Task.fromMap(Map map) {
    this.id = map[DatabaseHelper.columnTaskId];
    this.taskName = map[DatabaseHelper.columnTaskName];
    this.isComplete =
        map[DatabaseHelper.columnTaskIsComplete] == 1 ? true : false;
  }

  Map<String, Object> toMap() {
    return {
      DatabaseHelper.columnTaskName: this.taskName,
      DatabaseHelper.columnTaskIsComplete: this.isComplete ? 1 : 0,
    };
  }
  */
}
