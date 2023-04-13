import 'package:flash_chat/models/todo/Task.dart';
import 'package:flutter/cupertino.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [
    Task(title: "First Item Task", isDone: true),
    Task(title: "Second Item", isDone: false),
    Task(title: "Third Item Task", isDone: false),
    Task(title: "Fourth Item Task", isDone: false),
    Task(title: "Fifth Item Task", isDone: false),
    Task(title: "Sixth Item Task", isDone: true)
  ];

  int getTaskCount() {
    return taskList.length;
  }

  void removeTask(int index) {
    taskList.removeAt(index);
    notifyListeners();
  }

  void addTask(String title) {
    taskList.add(Task(title: title, isDone: false));
    notifyListeners();
  }

  void toggleTaskAt(int index) {
    taskList[index].toggleDone();
    notifyListeners();
  }
}
