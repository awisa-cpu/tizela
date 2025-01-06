import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../utils/device/app_debugger/app_debugger.dart';

class AppLocalDataStorageService {
  final _localStorage = GetStorage();

  

  void saveFavouritesLocally({
    required String key,
    required List<String> fav,
  }) async {
    await _localStorage.write(key, jsonEncode(fav));
  }

   List<String> readFavouritesFromLocal({ required String key,}) {
    try {
      final readValue = _localStorage.read(key);
      return (jsonDecode(readValue) as List<dynamic>)
          .map((element) => element as String)
          .toList();
    } catch (e) {
      AppDebugger.debugger(e);
      return [];
    }
  }
}
