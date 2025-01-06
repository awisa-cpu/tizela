import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';

class CarRentalRepository extends GetxController {
  static CarRentalRepository get instance => Get.find();

  ///variables
  final FirebaseFirestore database = FirebaseFirestore.instance;
  final String carRentalCollection = "CarRentalsCollection";

  ///methods

  Future<void> createNewCarRental({required CarRentalModel carRental}) async {
    try {
      await database
          .collection(carRentalCollection)
          .doc()
          .set(carRental.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<CarRentalModel> fetchCarRental({required String carRentalId}) async {
    try {
      final snapshot =
          await database.collection(carRentalCollection).doc(carRentalId).get();

      return CarRentalModel.fromDocSnapshot(docSnapshot: snapshot);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CarRentalModel>> fetchFavouritesCarRental(
      {required List<String> ids}) async {
    try {
      final query = await database
          .collection(carRentalCollection)
          .where(
            FieldPath.documentId,
            whereIn: ids,
          )
          .get();
      return query.docs
          .map((value) => CarRentalModel.fromDocSnapshot(docSnapshot: value))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CarRentalModel>> fetchAllCarRentals() async {
    try {
      final querySnapshot =
          await database.collection(carRentalCollection).get();

      final carRentals = querySnapshot.docs
          .map((qds) => CarRentalModel.fromDocSnapshot(docSnapshot: qds))
          .toList();

      return carRentals;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<CarRentalModel>> fetchAllCarRentalAsStream(
      {required String currentUserId}) {
    try {
      final carRentalStream = database
          .collection(carRentalCollection)
          .where(
            "userId",
            isEqualTo: currentUserId,
          )
          .snapshots();

      return carRentalStream.map((streamDatum) => streamDatum.docs
          .map((qcs) => CarRentalModel.fromDocSnapshot(docSnapshot: qcs))
          .toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editCarRental({required CarRentalModel carRental}) async {
    try {
      await database.collection(carRentalCollection).doc(carRental.uid).update(
            carRental.toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editSpecificCarRentalDetails({
    required String carRentalId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await database
          .collection(carRentalCollection)
          .doc(carRentalId)
          .update(data);
    } catch (e) {
      rethrow;
    }
  }
}
