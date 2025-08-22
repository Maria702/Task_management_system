import 'dart:io';

String? registeredUser;
String? registeredPassword;

void registerUser() {
  while (true) {
    print("\n User Registeration");
    print("================================");
    print("\nEnter User name");
    String? userName = stdin.readLineSync();

    if (userName == null || userName.isEmpty) {
      print("Username cannot be empty!");
      return;
    }

    print("Enter password:");
    String? password = stdin.readLineSync();

    print("Confirm Password:");
    String? confirmPassword = stdin.readLineSync();

    if (password != confirmPassword) {
      print("Wrong Password..  Try Again");
      continue;
    }

    registeredUser = userName;
    registeredPassword = password;
    print("Registered Successfully!");

    print("");
    break;
  }
}

// void loginUser() {
//   print("-----------------------------------");
//   print("Login to your account");
//   print("-----------------------------------");
//   print("\nEnter username");
//   String? userLogin = stdin.readLineSync();

//   print("Enter Password");
//   String? userPassowrd = stdin.readLineSync();

//   if (userLogin == null || userPassowrd == null) {
//     print(" No user registered. Please register first");
//   } else if (registeredUser == userLogin &&
//       registeredPassword == userPassowrd) {
//     print("Login successful! Welcome, $registeredUser!");
//   } else {
//     print("Invalid Username or password. Try again.");
//   }
// }

// void loginUser() {
//   while (true) {
//     print("-----------------------------------");
//     print("Login to your account");
//     print("-----------------------------------");

//     print("\nEnter username:");
//     String? userLogin = stdin.readLineSync();

//     print("Enter password:");
//     String? userPassword = stdin.readLineSync();

//     if (userLogin == null ||
//         userPassword == null ||
//         userLogin.isEmpty ||
//         userPassword.isEmpty) {
//       print("Username or password cannot be empty.");
//       continue; // loop back to login
//     }

//     if (registeredUser == userLogin && registeredPassword == userPassword) {
//       print("Login successful! Welcome, $registeredUser!");
//       break; // exit the loop on successful login
//     } else {
//       print("Invalid Username or Password. Try again.\n");
//     }
//   }
// }

void loginUser() {
  while (true) {
    print("-----------------------------------");
    print("Login to your account");
    print("-----------------------------------");

    print("\nEnter username:");
    String? userLogin = stdin.readLineSync();

    print("Enter password:");
    String? userPassword = stdin.readLineSync();

    if (userLogin == null ||
        userPassword == null ||
        userLogin.isEmpty ||
        userPassword.isEmpty) {
      print("Username or password cannot be empty.");
    } else if (registeredUser == userLogin &&
        registeredPassword == userPassword) {
      print("Login successful! Welcome, $registeredUser!");
      break;
    } else {
      print("Invalid Username or Password. Try again.\n");

      // Ask to try again or exit
      print("1) Try Login Again");
      print("2) Exit");
      stdout.write("Enter choice: ");
      String? retryChoice = stdin.readLineSync();

      if (retryChoice == "2") {
        print("Goodbye!");
        exit(0);
      } else if (retryChoice != "1") {
        print("Invalid choice. Exiting.");
        exit(0);
      }
    }
  }
}
