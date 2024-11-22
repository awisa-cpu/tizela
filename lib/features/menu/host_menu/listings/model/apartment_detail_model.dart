import 'package:get/get.dart';

class ApartmentDetailModel {
  String name;
  RxInt detailCount;
  ApartmentDetailModel({
    required this.name,
    required this.detailCount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'detailCount': detailCount.value,
    };
  }

  factory ApartmentDetailModel.fromJson(Map<String, dynamic> json) {
    return ApartmentDetailModel(
      name: json['name'] as String,
      detailCount: (json['detailCount'] as int).obs,
    );
  }
}
