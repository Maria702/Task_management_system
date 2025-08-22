import 'dart:io';
import 'addTask.dart';
import 'task_mdel.dart';
import 'viewTask.dart';
import 'deleteTask.dart';

void menu() {
  bool isloggedIn = true;
  while (isloggedIn) {
    if (taskList.isEmpty) {
      print("\nNo task is available");
    }
    print("-----------------------------------");
    print("Main Menu");
    print("1) Add Task/Habit");
    print("2) View Tasks");
    print("3) Delete Task");
    print("4) Logout");

    print("\nEnter Choice");
    String? userChoice = stdin.readLineSync();

    if (userChoice == "1") {
      addTaskMenu();
    }
    if (userChoice == "2") {
      viewTask();
    }
    if (userChoice == "3") {
      delete();
    }
    if (userChoice == "4") {
      print(
        "Logged out successfully.\n\nThank you for using Task Management System!",
      );
      isloggedIn = false;

      exit(0);
    }
    menu();
  }
}
