import 'dart:io';

String dateTime() {
  DateTime? startDate;
  while (true) {
    stdout.write("Set start date (yyyy-mm-dd): ");
    String? inputDate = stdin.readLineSync();

    if (inputDate == null || inputDate.isEmpty) {
      startDate = DateTime.now();
      print(
        "No date provided. Using current date: ${startDate.toIso8601String().substring(0, 10)}",
      );
      return startDate.toIso8601String().substring(0, 10);
    }

    startDate = DateTime.tryParse(inputDate);
    if (startDate == null) {
      print("Invalid format. Please enter in yyyy-mm-dd format.");
      continue;
    }
    return inputDate;
  }
}
