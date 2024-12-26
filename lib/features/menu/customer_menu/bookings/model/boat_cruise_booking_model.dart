import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';
import 'package:tizela/utils/enums/booking_status.dart';

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

  factory BoatCruiseBookingModel.froSnapshot(
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
