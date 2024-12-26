import 'package:get/get.dart';

import '../../../../../data/repositories/auth_repository/auth_repository.dart';
import '../../../../../data/repositories/car_rental_repository/car_rental_repository.dart';
import '../../../../../data/services/alert_services.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';
import '../../listings/model/car_rental_model.dart';

class HostCarRentalHomeController extends GetxController {
  static HostCarRentalHomeController get instance => Get.find();

  //variables
  RxBool showCarRentalAvailabilityConfirmation = true.obs;
  final String? _currentUserId = AuthRepository.instance.currentUser?.uid;
  final CarRentalRepository carRentalRepo = Get.put(CarRentalRepository());

  void onTapNoEditCarRentalAvailability() {
    showCarRentalAvailabilityConfirmation.value = false;
//and navigate to view to edit availability
  }

  void onTapYesConfirmCarRentalAvailability() {
    showCarRentalAvailabilityConfirmation.value = false;
  }

  //get total listings by host
  Stream<List<CarRentalModel>>? getCarRentalsTotalListings() {
    try {
      if (_currentUserId == null) {
        return null;
      }
      final carRentals = carRentalRepo.fetchAllCarRentalAsStream(
        currentUserId: _currentUserId,
      );

      return carRentals;
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap",
        message: "error fetching shortlets",
      );
      return null;
    }
  }

  //get total bookings made by customers

  //get total earnings achieved from successful bookings

  //handle car stats filter

  //fetch all recent bookings: cars successfully booked

  //fetch all pending reservations: cars with booking type not instant that required host action

  //on the show total earnings view: fetch all successful transactions (successful bookings made)
}
