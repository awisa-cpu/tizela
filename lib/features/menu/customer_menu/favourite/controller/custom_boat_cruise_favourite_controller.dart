import 'package:get/get.dart';
import 'package:tizela/data/repositories/boat_cruise_repository/boat_cruise_repository.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';

import '../../../../../data/services/alert_services.dart';
import '../../../../../data/services/app_local_data_storage_service.dart';

class CustomBoatCruiseFavouriteController extends GetxController {
  static CustomBoatCruiseFavouriteController get instance => Get.find();
  final RxList<String> _favBoatCruises = <String>[].obs;
  final String boatCruiseFavkey = "boatCruiseFavourites";
  final AppLocalDataStorageService _localStorageService =
      AppLocalDataStorageService();

  @override
  void onInit() {
    super.onInit();
    //
    final boatCruiseIds = _localStorageService.readFavouritesFromLocal(
      key: boatCruiseFavkey,
    );
    if (boatCruiseIds.isNotEmpty) {
      _favBoatCruises.assignAll(boatCruiseIds);
    }
  }

  //add to favourites
  void addOrRemoveFromBoatFavourites({required String boatCruiseId}) {
    if (!_favBoatCruises.contains(boatCruiseId)) {
      _favBoatCruises.add(boatCruiseId);
      AlertServices.showSnackBar(content: "item added to favourite");
    } else {
      _favBoatCruises.remove(boatCruiseId);
      AlertServices.showSnackBar(content: "item removed from favourite");
    }

    //
    _localStorageService.saveFavouritesLocally(
      key: boatCruiseFavkey,
      fav: _favBoatCruises,
    );
  }

  bool isAdded(String boatCruiseId) => _favBoatCruises.contains(boatCruiseId);

  //fetch saved favourites from server with their ids
  Future<List<BoatCruiseModel>> fetchBoatCruiseFavouritesWithIds() async {
    return BoatCruiseRepository.instance
        .fetchFavouritesBoatCruise(ids: _favBoatCruises);
  }
}
