import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({required this.onTaskAdded});
  var addTaskController = TextEditingController();
  Function onTaskAdded;

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              controller: addTaskController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: "Type task name here...",
                  hintStyle: TextStyle(color: Colors.grey)),
              style: TextStyle(color: Colors.black),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // Provider.of<TaskData>(context).addTask(newTaskTitle);
                onTaskAdded.call(newTaskTitle);
                addTaskController.clear();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
