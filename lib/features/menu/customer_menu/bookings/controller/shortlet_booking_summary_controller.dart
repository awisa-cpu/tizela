import 'package:get/get.dart';

class ShortletBookingSummaryController extends GetxController {
  static ShortletBookingSummaryController get instance => Get.find();

  RxBool isSamePersonCheckIn = false.obs;
  RxBool isSomeoneElseCheckIn = false.obs;
}
