import 'package:intl/intl.dart';

class AppDateFormater {
  static String formatDate({required DateTime date, String? format}) {
    return DateFormat( format??"dd-MM-yyyy").format(date);
  }

  static DateTime? convertToDate(String dateString) {
    return DateTime.tryParse(dateString);
  }
}
