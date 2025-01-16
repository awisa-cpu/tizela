import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tizela/utils/enums/booking_status.dart';
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
  final String bookingId;
  final String shortletId;
  final String userId;
  final Map<String, dynamic>
      shortletDetails; 
  final Map<String, dynamic> bookingUserDetails;
  BookingStatus status; //active-completed-cancelled
  final DateTime bookingDateCreated;
  final String bookingMode; // "direct" or "request"

  ShortletBookingModel({
    required this.bookingId,
    required this.shortletId,
    required this.userId,
    required this.shortletDetails,
    required this.bookingUserDetails,
    required this.status,
    required this.bookingDateCreated,
    required this.bookingMode,
  });

  Map<String, dynamic> toJson() {
    return {
      'shortletId': shortletId,
      'userId': userId,
      'shortletDetails':
          shortletDetails, //name, price, image, start and end date
      'bookingUserDetails': bookingUserDetails,
      'status': status.name,
      'bookingDateCreated': bookingDateCreated.toIso8601String(),
      'bookingMode': bookingMode,
    };
  }

  factory ShortletBookingModel.fromMap(Map<String, dynamic> json) {
    return ShortletBookingModel(
      bookingId: json['bookingId'] as String,
      shortletId: json['shortletId'] as String,
      userId: json['userId'] as String,
      shortletDetails: json['shortletDetails'] as Map<String, dynamic>,
      bookingUserDetails: json['bookingUserDetails'] as Map<String, dynamic>,
      status: BookingStatus.values
          .firstWhere((status) => status.name == json['status']),
      bookingDateCreated: DateTime.parse(json['bookingDateCreated'] as String),
      bookingMode: json['bookingMode'] as String,
    );
  }

  factory ShortletBookingModel.empty() => ShortletBookingModel(
        bookingId: '',
        shortletId: '',
        userId: '',
        shortletDetails: {},
        bookingUserDetails: {},
        status: BookingStatus.none,
        bookingDateCreated: DateTime.now(),
        bookingMode: '',
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
        status: BookingStatus.values
            .firstWhere((status) => status.name == docData['status']),
        bookingDateCreated:
            DateTime.parse(docData['bookingDateCreated'] as String),
        bookingMode: docData['bookingMode'] as String,
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
