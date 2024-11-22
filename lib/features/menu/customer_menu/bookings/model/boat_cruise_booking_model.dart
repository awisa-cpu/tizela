
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
      boatCruise: BoatCruiseModel.fromJson(json['boatCruise'] as Map<String,dynamic>),
      status: BookingStatus.values.firstWhere((status)=> status.name ==json['status']),
      dateToCruise: DateTime.parse(json['dateToCruise'] as String),
      passengerCount: json['passengerCount'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );
  }


}
