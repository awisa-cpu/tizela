import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/shortlet_booking_model.dart';

class ShortletBookingRepository extends GetxController {
  //
  static ShortletBookingRepository get instance => Get.find();
  final String _shortletBookingsCollection = "ShortletBookingsCollection";
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Future<List<ShortletBookingModel>> getShortletBookingsByStatus(
      {required String status}) async {
    // Get all shortlet bookings
    try {
      final querySnapshot = await _database
          .collection(_shortletBookingsCollection)
          .where("status", isEqualTo: status)
          .get();

      return querySnapshot.docs.map((snapshot)=>ShortletBookingModel.fromSnapShot(docSnapshot: snapshot)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createShortletBooking(
      ShortletBookingModel shortletBooking) async {
    try {
      await _database
          .collection(_shortletBookingsCollection)
          .doc()
          .set(shortletBooking.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
