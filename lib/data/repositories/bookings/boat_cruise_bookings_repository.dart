import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/boat_cruise_booking_model.dart';

class BoatCruiseBookingsRepository  extends GetxController{
  static BoatCruiseBookingsRepository get instance => Get.find();

  final String boatCruiseBookingsCollection = "boatCruiseBookings";
  final FirebaseFirestore database = FirebaseFirestore.instance;

  Future<List<BoatCruiseBookingModel>> fetchBoatCruiseBookingsByStatus({required String status}) async {
    try {
      final dataSnapshot =
          await database.collection(boatCruiseBookingsCollection).where('status',isEqualTo: status).get();
      return dataSnapshot.docs
          .map((doc) => BoatCruiseBookingModel.froSnapshot(doc))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}