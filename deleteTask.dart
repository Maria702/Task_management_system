import 'dart:io';
import 'addTask.dart';
import 'task_mdel.dart';
import 'menu.dart';

void delete() {
  if (taskList.isEmpty) {
    print("\nNo tasks or habits to delete.");
    menu();
    return;
  }

  print("\nWould you like to delete a task or habit?");
  print("1) Task");
  print("2) Habit");

  String? delOption = stdin.readLineSync();

  if (delOption == "1") {
    _deleteTask();
  } else if (delOption == "2") {
    _deleteHabit();
  } else {
    print("Invalid Choice");
    menu();
  }
}

void _deleteTask() {
  List<TaskModel> tasks =
      taskList.where((task) => task.type == "Task").toList();

  if (tasks.isEmpty) {
    print("\nNo tasks to delete.");
    menu();
    return;
  }

  print("\nYour Tasks to Delete:");
  for (int i = 0; i < tasks.length; i++) {
    print("${i + 1}) ${tasks[i].name} - Due: ${tasks[i].dueDate}");
  }

  print("\nEnter the task number you want to delete:");
  int taskNumber = int.parse(stdin.readLineSync()!);

  if (taskNumber < 1 || taskNumber > tasks.length) {
    print("Invalid task number.");
  } else {
    taskList.removeWhere((task) => task == tasks[taskNumber - 1]);
    print("Task deleted successfully!");
  }

  menu();
}

void _deleteHabit() {
  List<TaskModel> habits =
      taskList.where((task) => task.type == "Habit").toList();

  if (habits.isEmpty) {
    print("\nNo habits to delete.");
    menu();
    return;
  }

  print("\nYour Habits to Delete:");
  for (int i = 0; i < habits.length; i++) {
    print("${i + 1}) ${habits[i].name} - Due: ${habits[i].dueDate}");
  }

  print("\nEnter the habit number you want to delete:");
  int habitNumber = int.parse(stdin.readLineSync()!);

  if (habitNumber < 1 || habitNumber > habits.length) {
    print("Invalid habit number.");
  } else {
    taskList.removeWhere((task) => task == habits[habitNumber - 1]);
    print("Habit deleted successfully!");
  }

  menu();
}
