import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/personalization/host_personalization/profile/model/payment_details_model.dart';

class PaymentDetailsRepository extends GetxController {
  FirebaseFirestore database = FirebaseFirestore.instance;
  final String paymentDetailsColl = "PaymentDetailsCollection";

  //save user details to database
  Future<void> createNewPaymentDetails(
      {required PaymentDetailsModel paymentDetails}) async {
    try {
      await database
          .collection(paymentDetailsColl)
          .doc()
          .set(paymentDetails.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<PaymentDetailsModel> fetchPaymentDetailsByUserId(
      {required String hostUserId}) async {
    try {
      final snapshot = await database
          .collection(paymentDetailsColl)
          .where("hostUserId", isEqualTo: hostUserId)
          .get();

      return PaymentDetailsModel.fromDocSnapshot(
          docSnapshot: snapshot.docs.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePaymentDetials(
      {required PaymentDetailsModel paymentDetails}) async {
    try {
      await database
          .collection(paymentDetailsColl)
          .doc(paymentDetails.id)
          .update(paymentDetails.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletePaymantDetials({required String paymentDetailId}) async {
    try {
      await database
          .collection(paymentDetailsColl)
          .doc(paymentDetailId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
