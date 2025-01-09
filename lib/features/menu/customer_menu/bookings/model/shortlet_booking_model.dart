import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tizela/features/auth/models/app_user.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shortlet_model.dart';
import 'package:tizela/utils/enums/booking_status.dart';
import 'package:uuid/uuid.dart';

class ShortletBookingModel {
  final String uid;
  final ShortletModel shortlet;
  BookingStatus status;
  AppUser user;
  ShortletBookingModel({
    required this.shortlet,
    required this.status,
    required this.user,
  }) : uid = const  Uuid().v4();

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'shortlet': shortlet.toJson(),
      'status': status.name,
      'user': user.toJson(),
    };
  }

  factory ShortletBookingModel.fromMap(Map<String, dynamic> json) {
    return ShortletBookingModel(
      shortlet: ShortletModel.fromJson(json['shorlet'] as Map<String, dynamic>),
      status: BookingStatus.values
          .firstWhere((status) => status.name == json['status']),
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  factory ShortletBookingModel.empty() => ShortletBookingModel(
        shortlet: ShortletModel.empty(),
        status: BookingStatus.none,
        user: AppUser.empty(),
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
        user: AppUser.fromJson(
          docData['user'],
        ),
      );
    } else {
      return ShortletBookingModel.empty();
    }
  }
}
