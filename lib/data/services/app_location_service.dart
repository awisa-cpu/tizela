import "dart:async";

// import "package:geocoding/geocoding.dart";
// import "package:geocoding/geocoding.dart";
import "package:get/get.dart";
import "package:location/location.dart";

class AppLocationService extends GetxController {
  static final AppLocationService serviceIns = Get.find();
  final Location location;
  AppLocationService._() : location = Location();
  static AppLocationService get instance => AppLocationService._();
  factory AppLocationService() => instance;

  Future<bool> _isLocationServiceEnabled() async {
    return location.serviceEnabled();
  }

  Future<LocationData> getUserCurrentLocation() async {
    PermissionStatus permissionGranted;
    LocationData locationData;

    //check if location service is enabled
    bool isServiceEnabled = await _isLocationServiceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (isServiceEnabled) {
        throw Exception("Location service not enabled");
      }
    }

    permissionGranted = await location.hasPermission();

    //make sure permission is granted
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return Future.error("Permission not granted");
      }
    }

    locationData = await location.getLocation();

    return locationData;
  }

/*
  Future<Placemark?> getLocationDetailsByCoordinates(
      {required double lat, required double long}) async {
    List<Placemark> placemarks =
        await location.placemarkFromCoordinates(lat, long);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      return place;
    }

    return null;
  }

  */
}
