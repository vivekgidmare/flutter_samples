import 'package:flash_chat/screens/todey/add_task_screen.dart';
import 'package:flash_chat/screens/todey/task_list.dart';
import 'package:flutter/material.dart';

import '../../models/todo/Task.dart';

class ToDoScreen extends StatefulWidget {
  static String id = "todo/";
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  bool isChecked = true;
  List<Task> taskList = [
    Task(title: "First Item Task", isDone: true),
    Task(title: "Second Item", isDone: false),
    Task(title: "Third Item Task", isDone: false),
    Task(title: "Fourth Item Task", isDone: false),
    Task(title: "Fifth Item Task", isDone: false)
  ];

  void populateTaskList(String title) {
    setState(() {
      taskList.add(Task(title: title, isDone: false));
    });
  }

  void removeTaskItem(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen(
                        onTaskAdded: (title) {
                          populateTaskList(title);
                        },
                      ),
                    ),
                  ),
              isScrollControlled: true);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.menu,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Todoey",
                  style: TextStyle(
                      fontSize: 56.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "${taskList.length} Tasks",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: TaskList(
                taskList: taskList,
                onLongPress: (index) {
                  removeTaskItem(index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
