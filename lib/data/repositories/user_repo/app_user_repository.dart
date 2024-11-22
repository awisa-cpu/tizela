//this repository handles everything related to the app user, from saving in the db, retrieving, etc

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../features/auth/models/app_user.dart';
import '../../../utils/exceptions/user_exception.dart';

class AppUserRepository extends GetxController {
  static AppUserRepository get instance => Get.find();

  // final AuthRepository authRepo = AuthRepository.instance;
  FirebaseFirestore database = FirebaseFirestore.instance;
  final String usersCollection = "Users";

//create user
  Future<void> createNewUser(AppUser user) async {
    try {
      await database
          .collection(usersCollection)
          .doc(user.uid)
          .set(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

// fetch user
  Future<AppUser> fetchUserDetails({required String uid}) async {
    try {
      final userDocSnapshot =
          await database.collection(usersCollection).doc(uid).get();

      return AppUser.fromSnapshot(userDocSnapshot);
    } catch (e) {
      rethrow;
    }
  }

//update userrecord
  Future<void> updateUserRecord(AppUser user) async {
    try {
      await database
          .collection(usersCollection)
          .doc(user.uid)
          .update(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

//update specific user field
  Future<void> updateSpecificUserData({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    try {
      await database.collection(usersCollection).doc(uid).update(data);
    } catch (e) {
      rethrow;
    }
  }

//delete userrecord
  Future<void> deleteUserRecord(String userId) async {
    try {
      // await authRepo.deleteUserAccount();
      await database.collection(usersCollection).doc(userId).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> findUserByEmail({required String email}) async {
    try {
      final queryResult = await database
          .collection(usersCollection)
          .where(
            "emailAddress",
            isEqualTo: email,
          )
          .get();

      final queryCollection = queryResult.docs;
      if (queryCollection.isEmpty || !queryCollection.first.exists) {
        throw UserException(message: "No user with email found");
      }
      return true;
      
    } catch (e) {
      rethrow;
    }
  }
}

