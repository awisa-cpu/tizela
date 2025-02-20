import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentDetailsModel {
  String? id;
  final String hostUserId;
  String bankName;
  String accountNumber;
  String accountName;
  bool isAccountActive;
  PaymentDetailsModel({
    this.id,
    required this.hostUserId,
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.isAccountActive,
  });

  Map<String, dynamic> toJson() {
    return {
      "hostUserId": hostUserId,
      "bankName": bankName,
      "accountNumber": accountNumber,
      "accountName": accountName,
      "isAccountActive": isAccountActive,
    };
  }

  factory PaymentDetailsModel.empty() => PaymentDetailsModel(
        id: "",
        hostUserId: "",
        bankName: "",
        accountNumber: "",
        accountName: "",
        isAccountActive: false,
      );

  factory PaymentDetailsModel.fromDocSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> docSnapshot}) {
    if (docSnapshot.exists && docSnapshot.data() != null) {
      final data = docSnapshot.data()!;
      return PaymentDetailsModel(
        id: docSnapshot.id,
        hostUserId: data["hostUserId"],
        bankName: data['bankName'],
        accountNumber: data['accountNumber'],
        accountName: data['accountName'],
        isAccountActive: data['isAccountActive'],
      );
    }

    return PaymentDetailsModel.empty();
  }
}
