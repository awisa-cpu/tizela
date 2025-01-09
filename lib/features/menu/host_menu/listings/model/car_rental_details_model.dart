import 'package:get/get.dart';

class CarRentalDetailsModel {
  final String uid;
  String name;
  RxInt detailCount;
  CarRentalDetailsModel({
    required this.uid,
    required this.name,
    required this.detailCount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'detailCount': detailCount.value,
    };
  }

  factory CarRentalDetailsModel.fromJson(Map<String, dynamic> json) {
    return CarRentalDetailsModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      detailCount: (json['detailCount'] as int).obs,
    );
  }
}
