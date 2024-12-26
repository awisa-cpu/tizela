import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tizela/features/menu/host_menu/listings/model/address_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import 'package:tizela/utils/enums/booking_status.dart';

class CarRentalBookingModel {
  final String uid;
  final CarRentalModel carRental;
  BookingStatus status;
  AddressModel pickUp, dropOff;
  String pickUpTime;
  String bookingDuration;
  String itenery;
  CarRentalBookingModel({
    required this.uid,
    required this.carRental,
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
      );

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
      );
    } else {
      return CarRentalBookingModel.empty();
    }
  }
}
