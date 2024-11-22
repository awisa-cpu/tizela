// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';

class ApartmentHouseRulesModel {
  String name;
  RxBool isActive;
  String yesText, noText;
  RxBool isFirstValue, isSecondValue;

  ApartmentHouseRulesModel({
    required this.name,
    required this.isActive,
    required this.yesText,
    required this.noText,
    RxBool? isFirstValue,
    RxBool? isSecondValue,
  })  : isFirstValue = isFirstValue ?? false.obs,
        isSecondValue = isSecondValue ?? false.obs;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'isActive': isActive.value,
      'yesText': yesText,
      'noText': noText,
      'isFirstValue': isFirstValue.value,
      'isSecondValue': isSecondValue.value,
    };
  }

  factory ApartmentHouseRulesModel.fromJson(Map<String, dynamic> json) {
    return ApartmentHouseRulesModel(
      name: json['name'] as String,
      isActive: (json['isActive'] as bool).obs,
      yesText: json['yesText'] as String,
      noText: json['noText'] as String,
      isFirstValue: (json['isFirstValue'] as bool).obs,
      isSecondValue: (json['isSecondValue'] as bool).obs,
    );
  }
}
