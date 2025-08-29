import 'dart:io';
import 'menu.dart';
import 'register.dart';

void main() {
  print("\n================Welcome to Task Management System================");

  print("\n 1) Register");
  print(" 2) Exit");
  print("\nEnter Choice:");
  String? choice = stdin.readLineSync();

  if (choice == "1") {
    registerUser();

    while (true) {
      print("-----------------------------------");
      print("$registeredUser, you can:");
      print("1) Login");
      print("2) Exit");
      print("\nEnter Choice:");
      String? loginChoice = stdin.readLineSync();

      if (loginChoice == "1") {
        loginUser();
        menu();
        break;
      } else if (loginChoice == "2") {
        print("Exit.... GoodBye!");

        exit(0);
      } else {
        print("Invalid Choice... Try again.");
      }
    }
  } else if (choice == "2") {
    print("Exit.... GoodBye!");
    exit(0);
  } else {
    print("Invalid Choice... Please Try Again!");
  }
}
