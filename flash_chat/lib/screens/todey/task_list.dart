import 'package:flash_chat/screens/todey/todo_screen.dart';
import 'package:flutter/material.dart';

import '../../models/todo/Task.dart';

class TaskList extends StatefulWidget {
  TaskList({required this.taskList, required this.onLongPress});
  List<Task> taskList;
  Function onLongPress;
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskItem(
          title: widget.taskList[index].title,
          isChecked: widget.taskList[index].isDone,
          longPressCallback: () {
            widget.onLongPress.call(index);
          },
          checkCallback: (newValue) {
            setState(() {
              widget.taskList[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.taskList.length,
    );
  }

  /*
  List<Widget> getList() {
    List<Widget> list = [];
    for (var item in taskList) {
      list.add(TaskItem(
        title: item.title,
        isChecked: item.isDone,
        longPressCallback: () {},
        checkCallback: onCheckToggled,
      ));
    }
    return list;
  }

 @override
  Widget build(BuildContext context) {
    return ListView(
      children: getList(),
    );
  }*/
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
