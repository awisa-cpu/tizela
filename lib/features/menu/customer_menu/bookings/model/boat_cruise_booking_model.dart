// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tizela/utils/enums/booking_status.dart';

/*
class BoatCruiseBookingModel {
  final String uid;
  BoatCruiseModel boatCruise;
  BookingStatus status;
  DateTime dateToCruise;
  String passengerCount;
  String startTime;
  String endTime;
  BoatCruiseBookingModel({
    required this.uid,
    required this.boatCruise,
    required this.status,
    required this.dateToCruise,
    required this.passengerCount,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'boatCruise': boatCruise.toJson(),
      'status': status.name,
      'dateToCruise': dateToCruise.toIso8601String(),
      'passengerCount': passengerCount,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory BoatCruiseBookingModel.fromJson(Map<String, dynamic> json) {
    return BoatCruiseBookingModel(
      uid: json['uid'] as String,
      boatCruise:
          BoatCruiseModel.fromJson(json['boatCruise'] as Map<String, dynamic>),
      status: BookingStatus.values
          .firstWhere((status) => status.name == json['status']),
      dateToCruise: DateTime.parse(json['dateToCruise'] as String),
      passengerCount: json['passengerCount'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );
  }

  factory BoatCruiseBookingModel.empty() {
    return BoatCruiseBookingModel(
      uid: '',
      boatCruise: BoatCruiseModel.empty(),
      status: BookingStatus.none,
      dateToCruise: DateTime.now(),
      passengerCount: "",
      startTime: '',
      endTime: '',
    );
  }

  factory BoatCruiseBookingModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> docSnapshot) {
    if (docSnapshot.exists) {
      final docData = docSnapshot.data()!;
      return BoatCruiseBookingModel(
        uid: docSnapshot.id,
        boatCruise: BoatCruiseModel.fromJson(docData['boatCruise']),
        status: BookingStatus.values
            .firstWhere((status) => status.name == docData['status']),
        dateToCruise:
            DateTime.tryParse(docData['dateToCruise']) ?? DateTime.now(),
        passengerCount: docData['passengerCount'],
        startTime: docData['startTime'],
        endTime: docData['endTime'],
      );
    } else {
      return BoatCruiseBookingModel.empty();
    }
  }
}

*/
class BoatCruiseBookingModel {
  final String bookingId;
  final String boatCruiseId;
  final String userId;
  final Map<String, dynamic>
      boatCruiseDetails; //name, image, price, details(passenger-count),
  final Map<String, dynamic> transactionDetails;
  final DateTime bookingDateCreated;
  final BookingStatus status;
  BoatCruiseBookingModel({
    required this.bookingId,
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
