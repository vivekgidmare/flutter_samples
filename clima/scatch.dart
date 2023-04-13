import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  String? result2 = await task2();
  task3(result2);
}

void task1() {
  String result = "Task 1 data";
  print("task 1 completed");
}

Future<String?> task2() async {
  Duration duration = Duration(seconds: 3);
  String? result;
  await Future.delayed(duration, () {
    result = "Task 2 data";
    print("task 2 completed");
  });
  return result ?? "Default value";
}

void task3(String? task2Data) {
  Duration duration = Duration(seconds: 2);
  // sleep(duration);
  String result = "Task 3 data";
  print("task 3 completed with data:$task2Data");
}
