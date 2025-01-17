// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tizela/utils/enums/booking_status.dart';

class ShorletBookingReceipt {
  final String dateRange;
  final String checkIn;
  final String checkOut;
  final double amount;
  final double cautionAmount;
  final double totalAmount;
  final String name;
  final String email;
  final String transactionId;
  final BookingStatus status;
  ShorletBookingReceipt({
    required this.dateRange,
    required this.checkIn,
    required this.checkOut,
    required this.amount,
    required this.cautionAmount,
    required this.totalAmount,
    required this.name,
    required this.email,
    required this.transactionId,
    required this.status,
  });
}
