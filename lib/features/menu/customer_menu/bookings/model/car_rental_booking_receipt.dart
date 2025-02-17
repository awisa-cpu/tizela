import 'package:tizela/utils/enums/booking_status.dart';

class CarRentalBookingReceipt {
  final String date, pickUp, dropOff, name, email, transactionId,duration;
  final double amount, serviceFeeAmount, totalAmount;
  final BookingStatus status;

  const CarRentalBookingReceipt({
    required this.date,
    required this.pickUp,
    required this.dropOff,
    required this.duration,
    required this.amount,
    required this.serviceFeeAmount,
    required this.totalAmount,
    required this.name,
    required this.email,
    required this.transactionId,
    required this.status,
  });
}
