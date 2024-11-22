import 'package:intl/intl.dart';

class AppDateFormater {
  static String formatDate(DateTime date) {
    return DateFormat("dd-MM-yyyy").format(date);
  }

  static DateTime? convertToDate(String dateString) {
    return DateTime.tryParse(dateString);
  }
}
