import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';

///interact with the shorlet collection of the database
class ShorletRepository extends GetxController {
  static ShorletRepository get instance => Get.find();

  ///variables
  final FirebaseFirestore database = FirebaseFirestore.instance;
  final String shorletCollection = "ShorletsCollection";

  ///methods

  Future<void> createNewShorlet({required ShortletModel shorlet}) async {
    try {
      await database.collection(shorletCollection).doc().set(shorlet.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<ShortletModel> fetchShorlet({required String shorletId}) async {
    try {
      final snapshot =
          await database.collection(shorletCollection).doc(shorletId).get();

      return ShortletModel.fromDocReference(docSnapshot: snapshot);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ShortletModel>> fetchAllShorlets() async {
    try {
      final querySnapshot = await database.collection(shorletCollection).get();

      final shorlets = querySnapshot.docs
          .map((qds) => ShortletModel.fromDocReference(docSnapshot: qds))
          .toList();

      return shorlets;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<ShortletModel>> fetchHostShorlets({required String uid}) {
    try {
     
      final streamData = database
          .collection(shorletCollection)
          .where("userId", isEqualTo: uid)
          .snapshots();

      return streamData.map((streamDatum) => streamDatum.docs
          .map((qsc) => ShortletModel.fromDocReference(docSnapshot: qsc))
          .toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editShorlet({required ShortletModel shorlet}) async {
    try {
      await database.collection(shorletCollection).doc(shorlet.uid).update(
            shorlet.toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editSpecificShorletDetails({
    required String shorletId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await database.collection(shorletCollection).doc(shorletId).update(data);
    } catch (e) {
      rethrow;
    }
  }
}
