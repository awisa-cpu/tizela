import 'package:get/get.dart';

class BoatCruiseFeaturesModel {
  final String uid;
  String name;
  RxBool isActive;
  BoatCruiseFeaturesModel({
    required this.uid,
    required this.name,
    required this.isActive,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'isActive': isActive.value,
    };
  }

  factory BoatCruiseFeaturesModel.fromJson(Map<String, dynamic> json) {
    return BoatCruiseFeaturesModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      isActive: (json['isActive'] as bool).obs,
    );
  }
}
