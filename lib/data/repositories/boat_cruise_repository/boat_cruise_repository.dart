import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';

class BoatCruiseRepository extends GetxController {
  static BoatCruiseRepository get instance => Get.find();

  ///variables
  final FirebaseFirestore database = FirebaseFirestore.instance;
  final String boatCruiseCollection = "BoatCruiseCollection";

  ///methods

  Future<void> createNewBoatCruise(
      {required BoatCruiseModel boatCruise}) async {
    try {
      await database
          .collection(boatCruiseCollection)
          .doc()
          .set(boatCruise.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<BoatCruiseModel> fetchBoatCruise(
      {required String boatCruiseId}) async {
    try {
      final snapshot = await database
          .collection(boatCruiseCollection)
          .doc(boatCruiseId)
          .get();

      return BoatCruiseModel.fromDocSnapshot(docSnapshot: snapshot);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BoatCruiseModel>> fetchFavouritesBoatCruise(
      {required List<String> ids}) async {
    try {
      final query = await database
          .collection(boatCruiseCollection)
          .where(FieldPath.documentId, whereIn: ids)
          .get();

      final boatCruiseList = query.docs
          .map((qds) => BoatCruiseModel.fromDocSnapshot(docSnapshot: qds))
          .toList();

      return boatCruiseList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BoatCruiseModel>> fetchAllBoatCruise() async {
    try {
      final querySnapshot =
          await database.collection(boatCruiseCollection).get();

      final boatCruiseList = querySnapshot.docs
          .map((qds) => BoatCruiseModel.fromDocSnapshot(docSnapshot: qds))
          .toList();

      return boatCruiseList;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<BoatCruiseModel>> fetchAllBoatCruiseAsStream(
      {required String currentUserId}) {
    try {
      final boatCruiseStream = database
          .collection(boatCruiseCollection)
          .where("userId", isEqualTo: currentUserId)
          .snapshots();

      return boatCruiseStream.map((streamDatum) => streamDatum.docs
          .map(
            (qsc) => BoatCruiseModel.fromDocSnapshot(docSnapshot: qsc),
          )
          .toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editBoatCruise({required BoatCruiseModel boatCruise}) async {
    try {
      await database
          .collection(boatCruiseCollection)
          .doc(boatCruise.uid)
          .update(
            boatCruise.toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editSpecificBoatCruiseDetails({
    required String boatCruiseId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await database
          .collection(boatCruiseCollection)
          .doc(boatCruiseId)
          .update(data);
    } catch (e) {
      rethrow;
    }
  }
}
