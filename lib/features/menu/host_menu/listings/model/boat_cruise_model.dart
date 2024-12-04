// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tizela/features/menu/host_menu/listings/model/address_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_details_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_features_model.dart';

import 'boat_type_model.dart';

class BoatCruiseModel {
  String? uid;
  final String userId;
  String name;
  BoatTypeModel boatType;
  String? boatStory;
  AddressModel address;
  double boatFee;
  double ratingsCount;
  List<DateTime> availableDates;
  List<BoatCruiseDetailsModel> boatCruiseDetails;
  List<BoatCruiseFeaturesModel> boatAmenities;
  List<BoatCruiseFeaturesModel> boatSafetyFeatures;
  List<BoatCruiseFeaturesModel> boatCruiseSpecialtyAmenities;
  List<BoatCruiseFeaturesModel> boatPolicies;
  List<BoatCruiseFeaturesModel> boatSailorPolicies;
  List<String> boatImages;

  BoatCruiseModel({
    this.uid,
    required this.userId,
    required this.name,
    required this.boatType,
    this.boatStory,
    required this.address,
    required this.boatFee,
    required this.ratingsCount,
    required this.availableDates,
    required this.boatCruiseDetails,
    required this.boatAmenities,
    required this.boatSafetyFeatures,
    required this.boatCruiseSpecialtyAmenities,
    required this.boatPolicies,
    required this.boatSailorPolicies,
    required this.boatImages,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "userId": userId,
      'name': name,
      'boatType': boatType.toJson(),
      'boatStory': boatStory,
      'address': address.toJson(),
      'boatFee': boatFee,
      'ratingsCount': ratingsCount,
      'availableDates': availableDates.map((x) => x.toIso8601String()).toList(),
      'boatCruiseDetails': boatCruiseDetails.map((x) => x.toJson()).toList(),
      'boatAmenities': boatAmenities.map((x) => x.toJson()).toList(),
      'boatSafetyFeatures': boatSafetyFeatures.map((x) => x.toJson()).toList(),
      'boatCruiseSpecialtyAmenities':
          boatCruiseSpecialtyAmenities.map((x) => x.toJson()).toList(),
      'boatPolicies': boatPolicies.map((x) => x.toJson()).toList(),
      'boatSailorPolicies': boatSailorPolicies.map((x) => x.toJson()).toList(),
      'boatImages': boatImages,
    };
  }

  factory BoatCruiseModel.empty() {
    return BoatCruiseModel(
      uid: "",
      userId: "",
      name: "",
      boatType: BoatTypeModel.empty(),
      address: AddressModel.empty(),
      boatFee: 0.0,
      ratingsCount: 0.0,
      availableDates: [],
      boatCruiseDetails: [],
      boatAmenities: [],
      boatSafetyFeatures: [],
      boatCruiseSpecialtyAmenities: [],
      boatPolicies: [],
      boatSailorPolicies: [],
      boatImages: [],
    );
  }

  factory BoatCruiseModel.fromJson(Map<String, dynamic> json) {
    return BoatCruiseModel(
      uid: json['uid'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      boatType:
          BoatTypeModel.fromJson(json['boatType'] as Map<String, dynamic>),
      boatStory: json['boatStory'] != null ? json['boatStory'] as String : null,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      boatFee: json['boatFee'] as double,
      ratingsCount: json['ratingsCount'] as double,
      availableDates: List<DateTime>.from(
        (json['availableDates'] as List).map<DateTime>(
          (x) => DateTime.parse(x),
        ),
      ),
      boatCruiseDetails: (json['boatCruiseDetails'] as List)
          .map<BoatCruiseDetailsModel>(
            (x) => BoatCruiseDetailsModel.fromJson(x as Map<String, dynamic>),
          )
          .toList(),
      boatAmenities: (json['boatAmenities'] as List)
          .map<BoatCruiseFeaturesModel>(
            (x) => BoatCruiseFeaturesModel.fromJson(x as Map<String, dynamic>),
          )
          .toList(),
      boatSafetyFeatures: (json['boatSafetyFeatures'] as List)
          .map<BoatCruiseFeaturesModel>(
            (x) => BoatCruiseFeaturesModel.fromJson(x as Map<String, dynamic>),
          )
          .toList(),
      boatCruiseSpecialtyAmenities:
          (json['boatCruiseSpecialtyAmenities'] as List)
              .map<BoatCruiseFeaturesModel>(
                (x) =>
                    BoatCruiseFeaturesModel.fromJson(x as Map<String, dynamic>),
              )
              .toList(),
      boatPolicies: (json['boatPolicies'] as List)
          .map<BoatCruiseFeaturesModel>(
            (x) => BoatCruiseFeaturesModel.fromJson(x as Map<String, dynamic>),
          )
          .toList(),
      boatSailorPolicies: (json['boatSailorPolicies'] as List)
          .map<BoatCruiseFeaturesModel>(
            (x) => BoatCruiseFeaturesModel.fromJson(x as Map<String, dynamic>),
          )
          .toList(),
      boatImages: List<String>.from(
        (json['boatImages'] as List<String>),
      ),
    );
  }

  factory BoatCruiseModel.fromDocSnapshot({
    required DocumentSnapshot<Map<String, dynamic>> docSnapshot,
  }) {
    if (docSnapshot.exists && docSnapshot.data() != null) {
      final data = docSnapshot.data()!;

      return BoatCruiseModel(
        uid: docSnapshot.id,
        userId: data['userId'] as String,
        name: data['name'] as String,
        boatType:
            BoatTypeModel.fromJson(data['boatType'] as Map<String, dynamic>),
        boatStory: data['boatStory'] != null ? data['boatStory'] as String : '',
        address: AddressModel.fromJson(data['address'] as Map<String, dynamic>),
        boatFee: data['boatFee'] as double,
        ratingsCount: data['ratingsCount'] as double,
        availableDates: List<DateTime>.from(
          (data['availableDates'] as List).map<DateTime>(
            (x) => DateTime.parse(x),
          ),
        ),
        boatCruiseDetails: (data['boatCruiseDetails'] as List)
            .map<BoatCruiseDetailsModel>(
              (x) => BoatCruiseDetailsModel.fromJson(x),
            )
            .toList(),
        boatAmenities: (data['boatAmenities'] as List)
            .map<BoatCruiseFeaturesModel>(
              (x) => BoatCruiseFeaturesModel.fromJson(x),
            )
            .toList(),
        boatSafetyFeatures: (data['boatSafetyFeatures'] as List)
            .map<BoatCruiseFeaturesModel>(
              (x) => BoatCruiseFeaturesModel.fromJson(x),
            )
            .toList(),
        boatCruiseSpecialtyAmenities:
            (data['boatCruiseSpecialtyAmenities'] as List)
                .map<BoatCruiseFeaturesModel>(
                  (x) => BoatCruiseFeaturesModel.fromJson(x),
                )
                .toList(),
        boatPolicies: (data['boatPolicies'] as List)
            .map<BoatCruiseFeaturesModel>(
              (x) => BoatCruiseFeaturesModel.fromJson(x),
            )
            .toList(),
        boatSailorPolicies: (data['boatSailorPolicies'] as List)
            .map<BoatCruiseFeaturesModel>(
              (x) =>
                  BoatCruiseFeaturesModel.fromJson(x as Map<String, dynamic>),
            )
            .toList(),
        boatImages: List<String>.from(
          (data['boatImages'] as List),
        ),
      );
    }

    return BoatCruiseModel.empty();
  }

  BoatCruiseModel copyWith({
    String? uid,
    String? userId,
    String? name,
    BoatTypeModel? boatType,
    String? boatStory,
    AddressModel? address,
    double? boatFee,
    double? ratingsCount,
    List<DateTime>? availableDates,
    List<BoatCruiseDetailsModel>? boatCruiseDetails,
    List<BoatCruiseFeaturesModel>? boatAmenities,
    List<BoatCruiseFeaturesModel>? boatSafetyFeatures,
    List<BoatCruiseFeaturesModel>? boatCruiseSpecialtyAmenities,
    List<BoatCruiseFeaturesModel>? boatPolicies,
    List<BoatCruiseFeaturesModel>? boatSailorPolicies,
    List<String>? boatImages,
  }) {
    return BoatCruiseModel(
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      boatType: boatType ?? this.boatType,
      boatStory: boatStory ?? this.boatStory,
      address: address ?? this.address,
      boatFee: boatFee ?? this.boatFee,
      ratingsCount: ratingsCount ?? this.ratingsCount,
      availableDates: availableDates ?? this.availableDates,
      boatCruiseDetails: boatCruiseDetails ?? this.boatCruiseDetails,
      boatAmenities: boatAmenities ?? this.boatAmenities,
      boatSafetyFeatures: boatSafetyFeatures ?? this.boatSafetyFeatures,
      boatCruiseSpecialtyAmenities: boatCruiseSpecialtyAmenities ?? this.boatCruiseSpecialtyAmenities,
      boatPolicies: boatPolicies ?? this.boatPolicies,
      boatSailorPolicies: boatSailorPolicies ?? this.boatSailorPolicies,
      boatImages: boatImages ?? this.boatImages,
    );
  }
}
