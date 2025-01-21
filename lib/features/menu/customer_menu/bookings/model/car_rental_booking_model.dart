// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tizela/utils/enums/booking_status.dart';

/*
class CarRentalBookingModel {
  final String uid;
  final CarRentalModel carRental;
  BookingStatus status;
  AddressModel pickUp, dropOff;
  String pickUpTime;
  String bookingDuration;
  String itenery;
  final DateTime dateCreated;
  CarRentalBookingModel({
    required this.uid,
    required this.carRental,
    required this.dateCreated,
    required this.status,
    required this.pickUp,
    required this.dropOff,
    required this.pickUpTime,
    required this.bookingDuration,
    required this.itenery,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'carRental': carRental.toJson(),
      'status': status.name,
      'pickUp': pickUp.toJson(),
      'dropOff': dropOff.toJson(),
      'pickUpTime': pickUpTime,
      'bookingDuration': bookingDuration,
      'itenery': itenery,
      'dateCreated': dateCreated.toIso8601String(),
    };
  }

  factory CarRentalBookingModel.fromJson(Map<String, dynamic> json) {
    return CarRentalBookingModel(
      uid: json['uid'] as String,
      carRental:
          CarRentalModel.fromJson(json['carRental'] as Map<String, dynamic>),
      status: BookingStatus.values
          .firstWhere((status) => status.name == json['status']),
      pickUp: AddressModel.fromJson(json['pickUp'] as Map<String, dynamic>),
      dropOff: AddressModel.fromJson(json['dropOff'] as Map<String, dynamic>),
      pickUpTime: json['pickUpTime'] as String,
      bookingDuration: json['bookingDuration'] as String,
      itenery: json['itenery'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
    );
  }

  factory CarRentalBookingModel.empty() => CarRentalBookingModel(
      uid: "",
      carRental: CarRentalModel.empty(),
      status: BookingStatus.none,
      pickUp: AddressModel.empty(),
      dropOff: AddressModel.empty(),
      pickUpTime: "",
      bookingDuration: "",
      itenery: "",
      dateCreated: DateTime.now());

  factory CarRentalBookingModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> snapDocument) {
    if (snapDocument.exists) {
      final docData = snapDocument.data()!;
      return CarRentalBookingModel(
          uid: snapDocument.id,
          carRental: CarRentalModel.fromJson(docData['carRental']),
          status: BookingStatus.values
              .firstWhere((status) => status.name == docData['status']),
          pickUp: AddressModel.fromJson(docData['pickUp']),
          dropOff: AddressModel.fromJson(docData['dropOff']),
          pickUpTime: docData['pickUpTime'],
          bookingDuration: docData['bookingDuration'],
          itenery: docData['itenery'],
          dateCreated: DateTime.parse(docData['dateCreated'] as String));
    } else {
      return CarRentalBookingModel.empty();
    }
  }
}
*/

class CarRentalBookingModel {
  String? bookingId;
  final String carRentalId;
  final String userId;
  final Map<String, dynamic>
      carRentalDetails;
  
  final Map<String, dynamic> transactionDetails;
  final DateTime bookingDateCreated;
  BookingStatus status; //active-completed-cancelled
  CarRentalBookingModel({
    this.bookingId,
    required this.carRentalId,
    required this.userId,
    required this.carRentalDetails,
    required this.transactionDetails,
    required this.bookingDateCreated,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "carRentalId": carRentalId,
      "userId": userId,
      "carRentalDetails": carRentalDetails,
      "transactionDetails": transactionDetails,
      "bookingDateCreated": bookingDateCreated.toIso8601String(),
      "status": status.name,
    };
  }

  factory CarRentalBookingModel.empty() {
    return CarRentalBookingModel(
      bookingId: "",
      carRentalId: "",
      userId: "",
      carRentalDetails: {},
      transactionDetails: {},
      bookingDateCreated: DateTime.now(),
      status: BookingStatus.none,
    );
  }

  factory CarRentalBookingModel.fromJson(Map<String, dynamic> json) {
    return CarRentalBookingModel(
        bookingId: json['bookingId'] as String,
        carRentalId: json['carRentalId'] as String,
        userId: json['userId'] as String,
        carRentalDetails: json['carRentalDetails'] as Map<String, dynamic>,
        transactionDetails: json['transactionDetails'] as Map<String, dynamic>,
        bookingDateCreated:
            DateTime.parse(json['bookingDateCreated'] as String),
        status: BookingStatus.values
            .firstWhere((value) => value.name == json['status']));
  }

  factory CarRentalBookingModel.fromSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> snapshot}) {
    if (snapshot.exists) {
      final json = snapshot.data()!;
      return CarRentalBookingModel(
        bookingId: snapshot.id,
        carRentalId: json['carRentalId'] as String,
        userId: json['userId'] as String,
        carRentalDetails: json['carRentalDetails'] as Map<String, dynamic>,
        transactionDetails: json['transactionDetails'] as Map<String, dynamic>,
        bookingDateCreated:
            DateTime.parse(json['bookingDateCreated'] as String),
        status: BookingStatus.values
            .firstWhere((value) => value.name == json['status']));

    } else {
      return CarRentalBookingModel.empty();
    }
  }
/*

carName: string,
carPrice: double ,
carImage: String,
carRentalDetails: [{},{}],
pickUpTime: String,
duration: string
itenary: string
location: Address()

*/


}
