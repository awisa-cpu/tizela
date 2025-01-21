import 'package:intl/intl.dart';

class AppNumberFormater {
  static String formatCurrency(
      {required double amount,
      String currencyCode = 'NGN',
      bool shouldFormat = false}) {
    final formatedAmount =
        NumberFormat.currency(symbol: '', name: currencyCode).format(amount);

    return formatedAmount;
  }
}
