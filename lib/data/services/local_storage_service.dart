import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  //signleton
  LocalStorageService._local();
  static final LocalStorageService _ins = LocalStorageService._local();
  factory LocalStorageService.instance() => _ins;

  late final GetStorage userStorage;
  bool _isInitialized = false;

  Future<void> initUserRecord({required String userBucket}) async {
    if (!_isInitialized) {
      // Check if not initialized
      try {
        await GetStorage.init(userBucket);
        userStorage = GetStorage(userBucket);
        _isInitialized = true; // Set to true after initialization
      } catch (e) {
        rethrow;
      }
    }
  }

  ///save generic data
  Future<void> saveDataLocally<T>(
      {required String key, required T value}) async {
    await userStorage.write(key, value);
  }

  ///save only when it hasn't been saved before
  Future<void> saveDataIfNull<T>({
    required String key,
    required T value,
  }) async {
    await userStorage.writeIfNull(key, value);
  }

  ///read data locally
  T? readDataLocally<T>({required String key}) {
    return userStorage.read(key);
  }

  ///erase data from local storage by key
  Future<void> eraseDataFromLocalStorage({required String key}) async {
    await userStorage.remove(key);
  }

  ///erase all data from local storage
  Future<void> eraseAllLocalData() async {
    await userStorage.erase();
  }
}
