import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/car_rental_booking_model.dart';

class CarRentalBookingsRepository extends GetxController {
  static CarRentalBookingsRepository get instance => Get.find();
  final String carRentalBookingsCollection = "carRentalBookings";
  final FirebaseFirestore database = FirebaseFirestore.instance;

  Future<List<CarRentalBookingModel>> fetchCarRentalBookingsByStatus({required String status}) async {
    try {
      final dataSnapshot =
          await database.collection(carRentalBookingsCollection).where('status',isEqualTo: status).get();
      return dataSnapshot.docs
          .map((doc) => CarRentalBookingModel.fromSnapShot(doc))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
