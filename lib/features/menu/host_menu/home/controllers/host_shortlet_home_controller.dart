import 'package:get/get.dart';

import '../../../../../data/repositories/auth_repository/auth_repository.dart';
import '../../../../../data/repositories/shortlet_repository/shorlet_repository.dart';
import '../../../../../data/services/alert_services.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';
import '../../listings/model/shorlet_model.dart';

class HostShortletHomeController extends GetxController {
  static HostShortletHomeController get instance => Get.find();

  //variables

  final ShorletRepository shortletRepo = Get.put(ShorletRepository());
  final String? _currentUserId = AuthRepository.instance.currentUser?.uid;
  RxBool showShortletAvailabilityConfirmation = true.obs;

  void onTapNoEditShortletAvailability() {
    showShortletAvailabilityConfirmation.value = false;
//and navigate to view to edit availability
  }

  void onTapYesConfirmShortletAvailability() {
    showShortletAvailabilityConfirmation.value = false;
  }

  //total listings by the host
 Stream<List<ShortletModel>>? getShortletTotalListings() {
    try {
      if (_currentUserId == null) {
        return null;
      }
      final shortlets = shortletRepo.fetchHostShorlets(uid: _currentUserId);

      return shortlets;
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap",
        message: "error fetching shortlets",
      );
      return null;
    }
  }

  //total bookings of this shorlet by customers
  Future getShortletBookings() async{
    
  }

  //total earnings from bookings made by customers

  //fetch all recent bookings: shortlets successfully booked

  //fetch all pending reservations: shorlets with booking type not instant that required host action

  //handle stats filter

  //on the show total earnings view: fetch all successful transactions (successful bookings made)
}
