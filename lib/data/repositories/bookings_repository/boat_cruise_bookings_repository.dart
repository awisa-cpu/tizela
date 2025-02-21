import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/boat_cruise_booking_model.dart';

class BoatCruiseBookingsRepository extends GetxController {
  static BoatCruiseBookingsRepository get instance => Get.find();

  final String _boatCruiseBookingsCollection = "boatCruiseBookings";
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Future<List<BoatCruiseBookingModel>> fetchBoatCruiseBookingsByStatus(
      {required String status}) async {
    try {
      final querySnapshot = await _database
          .collection(_boatCruiseBookingsCollection)
          .where('status', isEqualTo: status)
          .get();
      return querySnapshot.docs
          .map((doc) => BoatCruiseBookingModel.fromSnapshot(snapshot: doc))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createBoatCruiseBooking(
      {required BoatCruiseBookingModel boatCruiseBooking}) async {
    try {
      await _database
          .collection(_boatCruiseBookingsCollection)
          .doc()
          .set(boatCruiseBooking.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
