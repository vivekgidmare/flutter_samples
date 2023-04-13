import 'package:flash_chat/models/todo/TaskData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
        builder: (BuildContext context, taskData, Widget? child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskItem(
            title: taskData.taskList[index].title,
            isChecked: taskData.taskList[index].isDone,
            longPressCallback: () {
              taskData.removeTask(index);
            },
            checkCallback: (newValue) {
              taskData.toggleTaskAt(index);
            },
          );
        },
        itemCount: taskData.getTaskCount(),
      );
    });
  }
}

class TaskItem extends StatelessWidget {
  TaskItem(
      {required this.title,
      required this.isChecked,
      required this.checkCallback,
      required this.longPressCallback});

  final String title;
  final bool isChecked;
  final Function checkCallback;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        longPressCallback.call();
      },
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        fillColor: MaterialStateProperty.all(Colors.blueAccent),
        checkColor: Colors.white,
        onChanged: (value) {
          checkCallback.call(value);
        },
        value: isChecked,
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  TaskCheckBox({
    required this.checkCallback,
    required this.isChecked,
  });
  final Function checkCallback;
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      fillColor: MaterialStateProperty.all(Colors.blueAccent),
      checkColor: Colors.white,
      onChanged: (value) {
        checkCallback.call(value);
      },
      value: isChecked,
    );
  }
}
