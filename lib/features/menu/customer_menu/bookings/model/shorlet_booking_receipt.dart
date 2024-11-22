// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShorletBookingReceipt {
  final String uid;
  final String shorletId;
  DateTime checkInDate;
  DateTime checkOutDate;
  ShorletBookingReceipt({
    required this.uid,
    required this.shorletId,
    required this.checkInDate,
    required this.checkOutDate,
  });
}
