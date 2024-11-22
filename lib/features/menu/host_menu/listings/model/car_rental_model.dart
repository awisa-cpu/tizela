import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tizela/features/menu/host_menu/listings/model/address_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_brand_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_details_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_features_model.dart';

class CarRentalModel {
  String? uid;
  final String userId;
  String carType;
  CarBrandModel carBrand;
  String carYear;
  AddressModel address;
  double carPrice;
  double ratingsCount;
  List<DateTime> availableDates;
  List<CarRentalDetailsModel> carRentalDetails;
  List<CarRentalFeaturesModel> carRentalFeatures;
  List<CarRentalFeaturesModel> safetyFeatures;
  List<CarRentalFeaturesModel> carPolicies;
  List<CarRentalFeaturesModel> driverPolicies;
  List<String> carImages;

  CarRentalModel({
    this.uid,
    required this.userId,
    required this.carType,
    required this.carBrand,
    required this.carYear,
    required this.address,
    required this.carPrice,
    required this.ratingsCount,
    required this.availableDates,
    required this.carRentalDetails,
    required this.carRentalFeatures,
    required this.safetyFeatures,
    required this.carPolicies,
    required this.driverPolicies,
    required this.carImages,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "userId": userId,
      'carType': carType,
      'carBrand': carBrand.toJson(),
      'carYear': carYear,
      'address': address.toJson(),
      'carPrice': carPrice,
      'ratingsCount': ratingsCount,
      'availableDates': availableDates.map((x) => x.toIso8601String()).toList(),
      'carRentalDetails': carRentalDetails.map((x) => x.toJson()).toList(),
      'carRentalFeatures': carRentalFeatures.map((x) => x.toJson()).toList(),
      'safetyFeatures': safetyFeatures.map((x) => x.toJson()).toList(),
      'carPolicies': carPolicies.map((x) => x.toJson()).toList(),
      'driverPolicies': driverPolicies.map((x) => x.toJson()).toList(),
      'carImages': carImages,
    };
  }

  factory CarRentalModel.empty() {
    return CarRentalModel(
      uid: "",
      userId: '',
      carType: '',
      carBrand: CarBrandModel.empty(),
      carYear: "",
      address: AddressModel.empty(),
      carPrice: 0.0,
      ratingsCount: 0.0,
      availableDates: [],
      carRentalDetails: [],
      carRentalFeatures: [],
      safetyFeatures: [],
      carPolicies: [],
      driverPolicies: [],
      carImages: [],
    );
  }
  factory CarRentalModel.fromJson(Map<String, dynamic> json) {
    return CarRentalModel(
      uid: json['uid'] as String,
      userId: json['userId'] as String,
      carType: json['carType'] as String,
      carBrand:
          CarBrandModel.fromJson(json['carBrand'] as Map<String, dynamic>),
      carYear: json['carYear'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      carPrice: json['carPrice'] as double,
      ratingsCount: json['ratingsCount'] as double,
      availableDates: List<DateTime>.from(
        (json['availableDates'] as List).map<DateTime>(
          (dt) => DateTime.parse(dt),
        ),
      ),
      carRentalDetails: (json['carRentalDetails'] as List)
          .map((detail) => CarRentalDetailsModel.fromJson(detail))
          .toList(),
      carRentalFeatures: (json['carRentalFeatures'] as List)
          .map((safe) => CarRentalFeaturesModel.fromJson(safe))
          .toList(),
      safetyFeatures: (json['safetyFeatures'] as List)
          .map((safe) => CarRentalFeaturesModel.fromJson(safe))
          .toList(),
      carPolicies: (json['carPolicies'] as List)
          .map((safe) => CarRentalFeaturesModel.fromJson(safe))
          .toList(),
      driverPolicies: (json['driverPolicies'] as List)
          .map((safe) => CarRentalFeaturesModel.fromJson(safe))
          .toList(),
      carImages: List<String>.from(
        (json['carImages'] as List<String>),
      ),
    );
  }

  factory CarRentalModel.fromDocSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> docSnapshot}) {
    if (docSnapshot.exists && docSnapshot.data() != null) {
      final data = docSnapshot.data()!;
      return CarRentalModel(
        uid: docSnapshot.id,
        userId: data['userId'] as String,
        carType: data['carType'] as String,
        carBrand:
            CarBrandModel.fromJson(data['carBrand'] as Map<String, dynamic>),
        carYear: data['carYear'] as String,
        address: AddressModel.fromJson(data['address']),
        carPrice: data['carPrice'] as double,
        ratingsCount: data['ratingsCount'] as double,
        availableDates: (data['availableDates'] as List)
            .map((ds) => DateTime.parse(ds))
            .toList(),
        carRentalDetails: (data['carRentalDetails'] as List)
            .map((x) => CarRentalDetailsModel.fromJson(x))
            .toList(),
        carRentalFeatures: (data['carRentalFeatures'] as List)
            .map((x) => CarRentalFeaturesModel.fromJson(x))
            .toList(),
        safetyFeatures: (data['safetyFeatures'] as List)
            .map((x) => CarRentalFeaturesModel.fromJson(x))
            .toList(),
        carPolicies: (data['carPolicies'] as List)
            .map((x) => CarRentalFeaturesModel.fromJson(x))
            .toList(),
        driverPolicies: (data['driverPolicies'] as List)
            .map((x) => CarRentalFeaturesModel.fromJson(x))
            .toList(),
        carImages: List.from(data['carImages'] as List),
      );
    }

    return CarRentalModel.empty();
  }
}
