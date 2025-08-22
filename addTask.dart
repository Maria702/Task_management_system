import 'dart:io';
import 'dateTime.dart';
import 'menu.dart';
import 'task_mdel.dart';

List<TaskModel> taskList = [];

void addTaskMenu() {
  print("-----------------------------------");
  print("Add Task or Habit");
  print("1) Task (One-Time)");
  print("2) Habit (recurring)");
  print("\n");
  print("Enter Choice");

  String? userTask = stdin.readLineSync();

  if (userTask == "1") {
    task();
  }
  if (userTask == "2") {
    habit();
  }
}

//=============================================Task Section
void task() {
  stdout.write("Enter Task: ");
  String? OneTimeTask = stdin.readLineSync();

  if (OneTimeTask == null || OneTimeTask.isEmpty) {
    print("Enter Task");
    return;
  }
  // stdout.write("Set due date (yyyy-mm-dd):");
  // String? setDueDate = stdin.readLineSync();
  // if (setDueDate == null || setDueDate.isEmpty) {
  //   print("Date cannot be empty. ");
  //   return;
  // }
  String setDueDate = dateTime();

  while (true) {
    stdout.write("Set Priority (1=High to 5=Low):");
    String? setPriority = stdin.readLineSync();
    if (setPriority == null || setPriority.isEmpty) {
      print("Set Priority");
      continue;
    }

    int? priority = int.tryParse(setPriority);
    if (priority == null || priority < 1 || priority > 5) {
      print("Priority must be between 1 and 5");
      continue;
    } else {
      taskList.add(
        TaskModel(
          name: OneTimeTask,
          dueDate: setDueDate,
          taskPriority: setPriority,
          type: "Task",
        ),
      );

      print(
        '''\nTask "$OneTimeTask" added successfully  and priority $priority!\n''',
      );

      menu();
    }
  }
}

// ===========================================================Habit Section

void habit() {
  stdout.write("Enter Habit Name: ");
  String? inputHabit = stdin.readLineSync();

  if (inputHabit == null || inputHabit.isEmpty) {
    print("Enter Habit Name");
    return;
  }

  print("Choose frequency:");
  print("1) Daily");
  print("2) Weekly");
  print("3) Monthly");

  while (true) {
    stdout.write("Enter Choice: ");
    String? inputFrequency = stdin.readLineSync();

    if (inputFrequency == null) {
      print("Please Enter a value");
      continue;
    }

    int? frequency = int.tryParse(inputFrequency!);
    if (frequency == null || frequency < 1 || frequency > 3) {
      print("Enter a valid number between 1 and 3");
      continue;
    }

    String setDueDate = dateTime();

    while (true) {
      stdout.write("Set priority (1=High to 5=Low): ");
      String? habtPriority = stdin.readLineSync();
      if (habtPriority == null || habtPriority.isEmpty) {
        print("Priority can not be empty");
        continue;
      }
      int? habitPriorit = int.tryParse(habtPriority);

      if (habitPriorit == null || habitPriorit < 0 || habitPriorit > 5) {
        print("Priority must be between 1 and 5");
        continue;
      } else {
        taskList.add(
          TaskModel(
            name: inputHabit,
            dueDate: setDueDate,
            taskPriority: habtPriority,
            type: "Habit",
          ),
        );

        print(
          '''\nHabit "$inputHabit" added successfully  and priority $habtPriority!\n''',
        );

        break;
      }
    }

    menu();
  }
}
