import 'package:get/get.dart';

class CarRentalFeaturesModel {
  final String uid;
  String name;
  RxBool isActive;
  CarRentalFeaturesModel({
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

  factory CarRentalFeaturesModel.fromJson(Map<String, dynamic> json) {
    return CarRentalFeaturesModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      isActive: (json['isActive'] as bool).obs,
    );
  }
}
