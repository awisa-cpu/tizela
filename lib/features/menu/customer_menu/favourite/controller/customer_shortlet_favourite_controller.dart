import 'package:get/get.dart';
import 'package:tizela/data/repositories/shortlet_repository/shorlet_repository.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';

import '../../../../../data/services/alert_services.dart';
import '../../../../../data/services/app_local_data_storage_service.dart';

class CustomShortletFavouriteController extends GetxController {
  static CustomShortletFavouriteController get instance => Get.find();
  final RxList<String> _favouritesShortlets = <String>[].obs;
  final String shortletFavouritesKey = "shortletFavourites";
  final AppLocalDataStorageService _localStorageService =
      AppLocalDataStorageService();

  @override
  void onInit() {
    super.onInit();
    final shortletIds = _localStorageService.readFavouritesFromLocal(
      key: shortletFavouritesKey,
    );
    if (shortletIds.isNotEmpty) {
      _favouritesShortlets.assignAll(shortletIds);
    }
  }

  //add to favourites
  void addOrRemoveFromShortletFavourites({required String shortletId}) {
    if (!_favouritesShortlets.contains(shortletId)) {
      _favouritesShortlets.add(shortletId);

      AlertServices.showSnackBar(content: "item added to favourite");
    } else {
      _favouritesShortlets.remove(shortletId);
      AlertServices.showSnackBar(content: "item removed from favourite");
    }
    //
    _localStorageService.saveFavouritesLocally(
      key: shortletFavouritesKey,
      fav: _favouritesShortlets,
    );
  }

  bool isAdded(String shortletId) => _favouritesShortlets.contains(shortletId);

  //fetch saved favourites from server with their ids
  Future<List<ShortletModel>> fetchShortletsFavouritesWithIds() async {
    return ShorletRepository.instance
        .fetchFavouritesShortlets(ids: _favouritesShortlets);
  }
}
