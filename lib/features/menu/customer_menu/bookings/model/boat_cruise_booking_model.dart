// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tizela/utils/enums/booking_status.dart';


class BoatCruiseBookingModel {
   String? bookingId;
  final String boatCruiseId;
  final String userId;
  final Map<String, dynamic>
      boatCruiseDetails; //name, image, price, details(passenger-count),
  final Map<String, dynamic> transactionDetails;
  final DateTime bookingDateCreated;
  final BookingStatus status;
  BoatCruiseBookingModel({
   this.bookingId,
    required this.boatCruiseId,
    required this.userId,
    required this.boatCruiseDetails,
    required this.transactionDetails,
    required this.bookingDateCreated,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "boatCruiseId": boatCruiseId,
      "userId": userId,
      "boatCruiseDetails": boatCruiseDetails,
      "transactionDetails": transactionDetails,
      "bookingDateCreated": bookingDateCreated.toIso8601String(),
      "status": status.name,
    };
  }

  factory BoatCruiseBookingModel.empty() {
    return BoatCruiseBookingModel(
      bookingId: "",
      boatCruiseId: "",
      userId: "",
      boatCruiseDetails: {},
      transactionDetails: {},
      bookingDateCreated: DateTime.now(),
      status: BookingStatus.none,
    );
  }

  factory BoatCruiseBookingModel.fromJson(Map<String, dynamic> json) {
    return BoatCruiseBookingModel(
        bookingId: json['bookingId'] as String,
        boatCruiseId: json['boatCruiseId'] as String,
        userId: json['userId'] as String,
        boatCruiseDetails: json['boatCruiseDetails'] as Map<String, dynamic>,
        transactionDetails: json['transactionDetails'] as Map<String, dynamic>,
        bookingDateCreated:
            DateTime.parse(json['bookingDateCreated'] as String),
        status: BookingStatus.values
            .firstWhere((value) => value.name == json['status']));
  }

  factory BoatCruiseBookingModel.fromSnapshot(


      {required DocumentSnapshot<Map<String, dynamic>> snapshot}) {
    if (snapshot.exists) {
      final json = snapshot.data()!;
      return BoatCruiseBookingModel(
          bookingId: snapshot.id,
          boatCruiseId: json['boatCruiseId'] as String,
          userId: json['userId'] as String,
          boatCruiseDetails: json['boatCruiseDetails'] as Map<String, dynamic>,
          transactionDetails:
              json['transactionDetails'] as Map<String, dynamic>,
          bookingDateCreated:
              DateTime.parse(json['bookingDateCreated'] as String),
          status: BookingStatus.values
              .firstWhere((value) => value.name == json['status']));
    } else {
      return BoatCruiseBookingModel.empty();
    }
  }


/*

boatName: string,
boatPrice: double ,
boatImage: String,
boatCruiseMaxPassenger: int,
boatCruiseDate: DateTime
startTime: String
endTime: String
passengerCount: String

*/

}
