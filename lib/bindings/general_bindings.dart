import 'package:get/get.dart';
import 'package:tizela/data/services/media_service.dart';
import 'package:tizela/data/services/network_service.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MediaServiceController());
    Get.put(NetworkServiceController());
  }
}
