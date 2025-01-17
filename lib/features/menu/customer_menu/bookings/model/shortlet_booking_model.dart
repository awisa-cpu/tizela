import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tizela/utils/enums/booking_status.dart';

import '../../../../../utils/enums/booking_type.dart';

/*
class ShortletBookingModel {
  final String uid;
  final ShortletModel shortlet;
  BookingStatus status;
  final DateTime bookingDate;
  final Map<String, dynamic> userDetails;
  ShortletBookingModel({
    required this.shortlet,
    required this.status,
    required this.bookingDate,
    required this.userDetails,
  }) : uid = const Uuid().v4();

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'shortlet': shortlet.toJson(),
      'status': status.name,
      'bookingDate': bookingDate.toIso8601String(),
      'userDetails': userDetails,
    };
  }

  factory ShortletBookingModel.fromMap(Map<String, dynamic> json) {
    return ShortletBookingModel(
      shortlet: ShortletModel.fromJson(json['shorlet'] as Map<String, dynamic>),
      status: BookingStatus.values
          .firstWhere((status) => status.name == json['status']),
      bookingDate: DateTime.parse(json['bookingDate'] as String),
      userDetails: json['userDetails'] as Map<String, dynamic>,
    );
  }

  factory ShortletBookingModel.empty() => ShortletBookingModel(
        shortlet: ShortletModel.empty(),
        status: BookingStatus.none,
        bookingDate: DateTime.now(),
        userDetails: {},
      );

  factory ShortletBookingModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> docSnapshot) {
    if (docSnapshot.exists) {
      final docData = docSnapshot.data()!;
      return ShortletBookingModel(
        shortlet:
            ShortletModel.fromJson(docData['shortlet'] as Map<String, Object>),
        status: BookingStatus.values
            .firstWhere((status) => status.name == docData['status']),
        bookingDate: DateTime.parse(docData['bookingDate'] as String),
        userDetails: docData['userDetails'] as Map<String, dynamic>,
      );
    } else {
      return ShortletBookingModel.empty();
    }
  }
}
*/
class ShortletBookingModel {
  final String? bookingId;
  final String shortletId;
  final String userId;
  final Map<String, dynamic> shortletDetails;
  final Map<String, dynamic> bookingUserDetails;
  final Map<String, dynamic> transactionDetails;
  BookingStatus status; //active-completed-cancelled
  final DateTime bookingDateCreated;
  final BookingType bookingType; // "instant" or "reserve"
  final double totalAmountPaid;

  ShortletBookingModel({
    this.bookingId,
    required this.shortletId,
    required this.userId,
    required this.shortletDetails,
    required this.bookingUserDetails,
    required this.transactionDetails,
    required this.status,
    required this.bookingDateCreated,
    required this.bookingType,
    required this.totalAmountPaid,
  });

  Map<String, dynamic> toJson() {
    return {
      'shortletId': shortletId,
      'userId': userId,
      'shortletDetails':
          shortletDetails, //name, price, image, start and end date
      'bookingUserDetails': bookingUserDetails,
      'transactionDetails': transactionDetails,
      'status': status.name,
      'bookingDateCreated': bookingDateCreated.toIso8601String(),
      'bookingType': bookingType.name,
      'totalAmountPaid':totalAmountPaid,
    };
  }

  factory ShortletBookingModel.fromMap(Map<String, dynamic> json) {
    return ShortletBookingModel(
      bookingId: json['bookingId'] ?? "",
      shortletId: json['shortletId'] as String,
      userId: json['userId'] as String,
      shortletDetails: json['shortletDetails'] as Map<String, dynamic>,
      bookingUserDetails: json['bookingUserDetails'] as Map<String, dynamic>,
      transactionDetails: json["transactionDetails"] as Map<String, dynamic>,
      status: BookingStatus.values
          .firstWhere((status) => status.name == json['status']),
      bookingDateCreated: DateTime.parse(json['bookingDateCreated'] as String),
      bookingType: BookingType.values
          .firstWhere((mode) => mode.name == json['bookingType']),
      totalAmountPaid: json['totalAmountPaid'] as double
    );
  }

  factory ShortletBookingModel.empty() => ShortletBookingModel(
        bookingId: '',
        shortletId: '',
        userId: '',
        shortletDetails: {},
        bookingUserDetails: {},
        transactionDetails: {},
        status: BookingStatus.none,
        bookingDateCreated: DateTime.now(),
        bookingType: BookingType.none,
        totalAmountPaid: 0.0,
      );

  factory ShortletBookingModel.fromSnapShot(
      {required DocumentSnapshot<Map<String, dynamic>> docSnapshot}) {
    if (docSnapshot.exists) {
      final docData = docSnapshot.data()!;
      return ShortletBookingModel(
        bookingId: docSnapshot.id,
        shortletId: docData['shortletId'] as String,
        userId: docData['userId'] as String,
        shortletDetails: docData['shortletDetails'] as Map<String, dynamic>,
        bookingUserDetails:
            docData['bookingUserDetails'] as Map<String, dynamic>,
        transactionDetails:
            docData['transactionDetails'] as Map<String, dynamic>,
        status: BookingStatus.values
            .firstWhere((status) => status.name == docData['status']),
        bookingDateCreated:
            DateTime.parse(docData['bookingDateCreated'] as String),
        bookingType: BookingType.values
            .firstWhere((mode) => mode.name == docData['bookingType']),
        totalAmountPaid: docData['totalAmountPaid'] as double
      );
    } else {
      return ShortletBookingModel.empty();
    }
  }

/*
shortletName: String,
shortletPrice: double,
shortletCautionFee: double
shortletImage: String
startDate: DateTime
endDate: DateTime

*/
}
