import 'addTask.dart';
import 'menu.dart';
import 'task_mdel.dart';

void viewTask() {
  if (taskList.isEmpty) {
    print("\nNo task is available\n");
    // menu();
    return;
  } else {
    print("\nYour Task: ");
    int taskCounter = 1;
    int habitCounter = 1;

    for (var task in taskList) {
      if (task.type == "Task") {
        print(
          "\nTask ${taskCounter++}:\nName : ${task.name}\nDueDate : ${task.dueDate}\nPriority : ${task.taskPriority} ",
        );
      } else if (task.type == "Habit") {
        print(
          "\nHabit ${habitCounter++}:\nName : ${task.name}\nDueDate : ${task.dueDate}\nPriority : ${task.taskPriority} ",
        );
      }
    }

    menu();
  }
}
