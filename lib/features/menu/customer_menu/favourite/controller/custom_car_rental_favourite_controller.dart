import 'package:get/get.dart';
import 'package:tizela/data/repositories/car_rental_repository/car_rental_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import '../../../../../data/services/app_local_data_storage_service.dart';

class CustomCarRentalFavouriteController extends GetxController {
  static CustomCarRentalFavouriteController get instance => Get.find();
  final RxList<String> _carRentalFavourites = <String>[].obs;
  final String carRentalFavouritesKey = "carRentalFavourites";
  final AppLocalDataStorageService _localStorageService =
      AppLocalDataStorageService();

  @override
  void onInit() {
    super.onInit();
    final shortletIds = _localStorageService.readFavouritesFromLocal(
      key: carRentalFavouritesKey,
    );
    if (shortletIds.isNotEmpty) {
      _carRentalFavourites.assignAll(shortletIds);
    }
  }

  void addOrRemoveFromCarRentalFavourites({required String carRentalId}) {
    if (!_carRentalFavourites.contains(carRentalId)) {
      _carRentalFavourites.add(carRentalId);
      AlertServices.showSnackBar(content: "item added to favourite");
    } else {
      _carRentalFavourites.remove(carRentalId);
      AlertServices.showSnackBar(content: "item removed from favourite");
    }

    //
    _localStorageService.saveFavouritesLocally(
      key: carRentalFavouritesKey,
      fav: _carRentalFavourites,
    );
  }

//todo: real-time updating in the favourite view without user going out
  bool isAdded({required String carRentalId}) =>
      _carRentalFavourites.contains(carRentalId);

  //fetch saved favourites from server with their ids
  Future<List<CarRentalModel>> fetchCarRentalFavouritesWithIds() async {
    return CarRentalRepository.instance
        .fetchFavouritesCarRental(ids: _carRentalFavourites);
  }
}
