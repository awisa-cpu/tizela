import 'package:get/get.dart';

class BoatCruiseDetailsModel {
  final String uid;
  String name;
  RxInt detailCount;
  BoatCruiseDetailsModel({
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

  factory BoatCruiseDetailsModel.fromJson(Map<String, dynamic> json) {
    return BoatCruiseDetailsModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      detailCount: (json['detailCount'] as int).obs,
    );
  }
}
