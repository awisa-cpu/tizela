// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tizela/features/menu/customer_menu/home/model/apartment_type_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/address_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/apartment_amenities_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/apartment_detail_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/apartment_house_rules_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/id_type_model.dart';

import '../../../../../utils/enums/booking_type.dart';

class ShortletModel {
  String? uid;
  final String userId;
  ApartmentTypeModel apartmentType;
  String apartmentName;
  String? anyStory;
  AddressModel address;
  double apartmentPrice;
  double cautionFee;
  double ratingsCount;
  List<DateTime> availableDates;
  String checkInTime, checkOutTime;
  String minimumCheckInTime;
  List<ApartmentDetailModel> apartmentDetails;
  List<ApartmentAmenitiesModel> amenities;
  List<ApartmentAmenitiesModel> safetyFeatures;
  List<ApartmentAmenitiesModel> standOutAmenities;
  List<ApartmentHouseRulesModel> houseRules;
  String thumbImage;
  List<String> apartmentImages;
  IdTypeModel idType;
  BookingType bookingType;

  ShortletModel({
    this.uid,
    required this.userId,
    required this.apartmentType,
    required this.apartmentName,
    this.anyStory,
    required this.address,
    required this.apartmentPrice,
    required this.cautionFee,
    required this.ratingsCount,
    required this.availableDates,
    required this.checkInTime,
    required this.checkOutTime,
    required this.minimumCheckInTime,
    required this.apartmentDetails,
    required this.amenities,
    required this.safetyFeatures,
    required this.standOutAmenities,
    required this.houseRules,
    required this.thumbImage,
    required this.apartmentImages,
    required this.idType,
    required this.bookingType,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "userId": userId,
      'apartmentType': apartmentType.toJson(),
      'apartmentName': apartmentName,
      'anyStory': anyStory ?? "",
      'address': address.toJson(),
      'apartmentPrice': apartmentPrice,
      'cautionFee': cautionFee,
      'ratingsCount': ratingsCount,
      'availableDates': availableDates.map((e) => e.toIso8601String()).toList(),
      "checkinTime": checkInTime,
      'checkOutTime': checkOutTime,
      'minimumCheckInTime': minimumCheckInTime,
      'apartmentDetails':
          apartmentDetails.map((apDe) => apDe.toJson()).toList(),
      'amenities': amenities.map((ame) => ame.toJson()).toList(),
      'safetyFeatures':
          safetyFeatures.map((safety) => safety.toJson()).toList(),
      'standOutAmenities':
          standOutAmenities.map((same) => same.toJson()).toList(),
      'houseRules': houseRules.map((house) => house.toJson()).toList(),
      'thumbImage': thumbImage,
      'apartmentImages': apartmentImages,
      'idType': idType.toJson(),
      'bookingType':bookingType.name,
    };
  }

  factory ShortletModel.fromJson(Map<String, dynamic> json) {
    return ShortletModel(
      uid: json['uid'] as String,
      userId: json['userId'] as String,
      apartmentType: ApartmentTypeModel.fromJson(
          json['apartmentType'] as Map<String, dynamic>),
      apartmentName: json['apartmentName'] as String,
      anyStory: json['anyStory'] != null ? json['anyStory'] as String : '',
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      apartmentPrice: json['apartmentPrice'] as double,
      cautionFee: json['cautionFee'] as double,
      ratingsCount: json['ratingsCount'] as double,
      availableDates: List<DateTime>.from(
        (json['availableDates'] as List<String>).map<DateTime>(
          (dateString) => DateTime.tryParse(dateString) ?? DateTime.now(),
        ),
      ),
      checkInTime: json['checkinTime'] as String,
      checkOutTime: json['checkOutTime'] as String,
      minimumCheckInTime: json['minimumCheckInTime'] as String,
      apartmentDetails: (json['apartmentDetails'] as List)
          .map((e) => ApartmentDetailModel.fromJson(e))
          .toList(),
      amenities: (json['amenities'] as List)
          .map((ame) => ApartmentAmenitiesModel.fromJson(ame))
          .toList(),
      safetyFeatures: (json['safetyFeatures'] as List)
          .map((safety) => ApartmentAmenitiesModel.fromJson(safety))
          .toList(),
      standOutAmenities: (json['standOutAmenities'] as List)
          .map((ame) => ApartmentAmenitiesModel.fromJson(ame))
          .toList(),
      houseRules: (json['houseRules'] as List)
          .map((house) => ApartmentHouseRulesModel.fromJson(house))
          .toList(),
      thumbImage: json['thumbImage'] as String,
      apartmentImages: List.from(json['apartmentImages']),
      idType: IdTypeModel.fromJson(json['idType']),
      bookingType: BookingType.values.firstWhere((type)=>type.name == json['bookingType'])
    );
  }

  factory ShortletModel.empty() {
    return ShortletModel(
      uid: "",
      userId: "",
      apartmentType: ApartmentTypeModel.empty(),
      apartmentName: "",
      address: AddressModel.empty(),
      apartmentPrice: 0.0,
      cautionFee: 0.0,
      ratingsCount: 0.0,
      availableDates: [],
      checkInTime: '',
      checkOutTime: '',
      minimumCheckInTime: '',
      apartmentDetails: [],
      amenities: [],
      safetyFeatures: [],
      standOutAmenities: [],
      houseRules: [],
      thumbImage: '',
      apartmentImages: [],
      idType: IdTypeModel.empty(),
      bookingType: BookingType.none,
    );
  }

  factory ShortletModel.fromDocReference(
      {required DocumentSnapshot<Map<String, dynamic>> docSnapshot}) {
    if (docSnapshot.exists && docSnapshot.data() != null) {
      final data = docSnapshot.data()!;

      //
      return ShortletModel(
        uid: docSnapshot.id,
        userId: data['userId'] as String,
        apartmentType: ApartmentTypeModel.fromJson(
            data['apartmentType'] as Map<String, dynamic>),
        apartmentName: data['apartmentName'] as String,
        address: AddressModel.fromJson(data['address'] as Map<String, dynamic>),
        apartmentPrice: data['apartmentPrice'] as double,
        cautionFee: data['cautionFee'] as double,
        ratingsCount: data['ratingsCount'] as double,
        anyStory: data['anyStory'] as String,
        availableDates: List<DateTime>.from(
            (data['availableDates'] as List).map((ds) => DateTime.parse(ds))),
        checkInTime: data['checkinTime'] as String,
        checkOutTime: data['checkOutTime'] as String,
        minimumCheckInTime: data['minimumCheckInTime'] as String,
        apartmentDetails: (data['apartmentDetails'] as List)
            .map((apart) => ApartmentDetailModel.fromJson(apart))
            .toList(),
        amenities: (data['amenities'] as List)
            .map((amenity) => ApartmentAmenitiesModel.fromJson(amenity))
            .toList(),
        safetyFeatures: (data['safetyFeatures'] as List)
            .map((sF) => ApartmentAmenitiesModel.fromJson(sF))
            .toList(),
        standOutAmenities: (data['standOutAmenities'] as List)
            .map((am) => ApartmentAmenitiesModel.fromJson(am))
            .toList(),
        houseRules: (data['houseRules'] as List)
            .map((houseRule) => ApartmentHouseRulesModel.fromJson(houseRule))
            .toList(),
        thumbImage: data['thumbImage'] as String,
        apartmentImages: List.from(data['apartmentImages'] as List),
        idType: IdTypeModel.fromJson(data['idType'] as Map<String, dynamic>),
        bookingType: BookingType.values.firstWhere((type)=>type.name==data['bookingType'])
      );
    }
    return ShortletModel.empty();
  }

  ShortletModel copyWith({
    String? uid,
    String? userId,
    ApartmentTypeModel? apartmentType,
    String? apartmentName,
    String? anyStory,
    AddressModel? address,
    double? apartmentPrice,
    double? cautionFee,
    double? ratingsCount,
    List<DateTime>? availableDates,
    String? checkInTime,
    String? checkOutTime,
    String? minimumCheckInTime,
    List<ApartmentDetailModel>? apartmentDetails,
    List<ApartmentAmenitiesModel>? amenities,
    List<ApartmentAmenitiesModel>? safetyFeatures,
    List<ApartmentAmenitiesModel>? standOutAmenities,
    List<ApartmentHouseRulesModel>? houseRules,
    String? thumbImage,
    List<String>? apartmentImages,
    IdTypeModel? idType,
    BookingType? bookingType,
  }) {
    return ShortletModel(
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      apartmentType: apartmentType ?? this.apartmentType,
      apartmentName: apartmentName ?? this.apartmentName,
      anyStory: anyStory ?? this.anyStory,
      address: address ?? this.address,
      apartmentPrice: apartmentPrice ?? this.apartmentPrice,
      cautionFee: cautionFee ?? this.cautionFee,
      ratingsCount: ratingsCount ?? this.ratingsCount,
      availableDates: availableDates ?? this.availableDates,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      checkInTime: checkInTime ?? this.checkInTime,
      minimumCheckInTime: minimumCheckInTime ?? this.minimumCheckInTime,
      apartmentDetails: apartmentDetails ?? this.apartmentDetails,
      amenities: amenities ?? this.amenities,
      safetyFeatures: safetyFeatures ?? this.safetyFeatures,
      standOutAmenities: standOutAmenities ?? this.standOutAmenities,
      houseRules: houseRules ?? this.houseRules,
      thumbImage: thumbImage ?? this.thumbImage,
      apartmentImages: apartmentImages ?? this.apartmentImages,
      idType: idType ?? this.idType,
      bookingType: bookingType??this.bookingType,
    );
  }
}
