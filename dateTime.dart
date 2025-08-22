import 'dart:io';

String dateTime() {
  DateTime? startDate;
  while (true) {
    stdout.write("Set start date (yyyy-mm-dd): ");
    String? inputDate = stdin.readLineSync();

    if (inputDate == null || inputDate.isEmpty) {
      print("Date can not be empty");
      continue;
    }

    startDate = DateTime.tryParse(inputDate);
    if (startDate == null) {
      print("Invalid format. Please enter in yyyy-mm-dd format.");
      continue;
    }
    return inputDate;
  }
}
