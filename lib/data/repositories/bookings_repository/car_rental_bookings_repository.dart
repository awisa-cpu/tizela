import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/car_rental_booking_model.dart';

class CarRentalBookingsRepository extends GetxController {
  static CarRentalBookingsRepository get instance => Get.find();
  final String _carRentalBookingsCollection = "carRentalBookingsCollection";
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Future<List<CarRentalBookingModel>> fetchCarRentalBookingsByStatus({required String status}) async {
    try {
      final querySnapshot =
          await _database.collection(_carRentalBookingsCollection).where('status',isEqualTo: status).get();
      return querySnapshot.docs
          .map((doc) => CarRentalBookingModel.fromSnapshot(snapshot: doc))
          .toList();
    } catch (e) {
      rethrow;
    }
  }



Future<void> createCarRentalBooking({required CarRentalBookingModel carRentalBooking}) async{
  try {
    await _database.collection(_carRentalBookingsCollection).doc().set(carRentalBooking.toJson());
    
  } catch (e) {
    rethrow;
  }
}


}
