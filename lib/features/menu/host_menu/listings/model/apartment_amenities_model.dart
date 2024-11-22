import 'package:get/get.dart';

class ApartmentAmenitiesModel {
  String name;
  RxBool isActive;
  ApartmentAmenitiesModel({
    required this.name,
    required this.isActive,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'isActive': isActive.value,
    };
  }

  factory ApartmentAmenitiesModel.fromJson(Map<String, dynamic> json) {
    return ApartmentAmenitiesModel(
      name: json['name'] as String,
      isActive: (json['isActive'] as bool).obs,
    );
  }
}
