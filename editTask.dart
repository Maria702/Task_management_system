import 'dart:io';
import 'menu.dart';
import 'task_mdel.dart';
import 'addTask.dart';

// =============================================== Edit Task Functionality
void editTask() {
  if (taskList.isEmpty) {
    print("No tasks available to edit.");
    return;
  }

  print("Select a task to edit:");

  // Display the current tasks
  for (int i = 0; i < taskList.length; i++) {
    print(
      "${i + 1}) ${taskList[i].name} - Due Date: ${taskList[i].dueDate} - Priority: ${taskList[i].taskPriority}",
    );
  }

  stdout.write("Enter task number to edit: ");
  String? taskChoice = stdin.readLineSync();
  int taskIndex = int.tryParse(taskChoice ?? '') ?? -1;

  if (taskIndex < 1 || taskIndex > taskList.length) {
    print("Invalid task number.");
    return;
  }

  TaskModel selectedTask = taskList[taskIndex - 1];

  // Edit task name
  stdout.write(
    "Enter new name for the task (leave empty to keep current name: ${selectedTask.name}): ",
  );
  String? newName = stdin.readLineSync();
  if (newName != null && newName.isNotEmpty) {
    selectedTask.name = newName;
  }

  // Edit task due date
  stdout.write(
    "Enter new due date (yyyy-mm-dd, leave empty to keep current date: ${selectedTask.dueDate}): ",
  );
  String? newDueDate = stdin.readLineSync();
  if (newDueDate != null && newDueDate.isNotEmpty) {
    selectedTask.dueDate = newDueDate;
  }

  // Edit task priority
  stdout.write(
    "Enter new priority (1=High to 5=Low, leave empty to keep current priority: ${selectedTask.taskPriority}): ",
  );
  String? newPriority = stdin.readLineSync();
  if (newPriority != null && newPriority.isNotEmpty) {
    int? priority = int.tryParse(newPriority);
    if (priority != null && priority >= 1 && priority <= 5) {
      selectedTask.taskPriority = newPriority;
    } else {
      print("Invalid priority. Keeping current priority.");
    }
  }

  print(
    "Task updated successfully: ${selectedTask.name} - Due Date: ${selectedTask.dueDate} - Priority: ${selectedTask.taskPriority}",
  );
  menu();
}
