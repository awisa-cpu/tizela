import 'package:get/get.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';

import '../../../../../data/repositories/auth_repository/auth_repository.dart';
import '../../../../../data/repositories/boat_cruise_repository/boat_cruise_repository.dart';
import '../../../../../data/services/alert_services.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';

class HostBoatCruiseHomeController extends GetxController {
  static HostBoatCruiseHomeController get instance => Get.find();

  //variables
  final BoatCruiseRepository boatCruiseRepo = Get.put(BoatCruiseRepository());
  final String? _currentUserId = AuthRepository.instance.currentUser?.uid;
  RxBool showBoatCruiseAvailabilityConfirmation = true.obs;

  void onTapNoEditBoatCruiseAvailability() {
    showBoatCruiseAvailabilityConfirmation.value = false;
//and navigate to view to edit availability
  }

  void onTapYesConfirmBoatCruiseAvailability() {
    showBoatCruiseAvailabilityConfirmation.value = false;
  }

  //get total listings by host
  Stream<List<BoatCruiseModel>>? getBoatCruiseTotalListings() {
    try {
      if (_currentUserId == null) {
        return null;
      }
      final boatCruiseList = boatCruiseRepo.fetchAllBoatCruiseAsStream(
        currentUserId: _currentUserId,
      );

      return boatCruiseList;
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

  //handle boats stats filter

  //fetch all recent bookings: boats successfully booked

  //fetch all pending reservations: boats with booking type not instant that required host action

  //on the show total earnings view: fetch all successful transactions (successful bookings made)
}
