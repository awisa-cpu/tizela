import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/shortlet_booking_model.dart';

class ShortletBookingRepository  extends GetxController {
  static ShortletBookingRepository get instance => Get.find();

  //
  final String shortletBookingsCollection = "ShortletBookings";
  final FirebaseFirestore database = FirebaseFirestore.instance;

  Future<List<ShortletBookingModel>> getShortletBookingsByStatus(
      {required String status}) async {
    // Get all shortlet bookings
    try {
      final dataSnapshot = await database
          .collection(shortletBookingsCollection)
          .where("status", isEqualTo: status)
          .get();

      return dataSnapshot.docs
          .map((doc) => ShortletBookingModel.fromSnapShot(doc))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
