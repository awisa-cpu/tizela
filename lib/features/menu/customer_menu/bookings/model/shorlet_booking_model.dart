import 'package:tizela/features/auth/models/app_user.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';
import 'package:tizela/utils/enums/booking_status.dart';

class ShorletBookingModel {
  final String uid;
  final ShortletModel shorlet;
  BookingStatus status;
  AppUser user;
  ShorletBookingModel({
    required this.uid,
    required this.shorlet,
    required this.status,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'shorlet': shorlet.toJson(),
      'status': status.name,
      'user': user.toJson(),
    };
  }

  factory ShorletBookingModel.fromMap(Map<String, dynamic> json) {
    return ShorletBookingModel(
      uid: json['uid'] as String,
      shorlet: ShortletModel.fromJson(json['shorlet'] as Map<String, dynamic>),
      status: BookingStatus.values
          .firstWhere((status) => status.name == json['status']),
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
