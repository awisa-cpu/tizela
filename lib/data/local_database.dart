import 'package:get/get.dart';
import 'package:tizela/features/menu/customer_menu/home/model/apartment_type_model.dart';
import 'package:tizela/features/menu/customer_menu/home/model/boat_cruise_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/model/boat_type_details_model.dart';
import 'package:tizela/features/menu/customer_menu/home/model/car_details_model.dart';
import 'package:tizela/features/menu/customer_menu/home/model/car_rental_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/model/more_car_section_model.dart';
import 'package:tizela/features/menu/customer_menu/home/model/destination_model.dart';
import 'package:tizela/features/menu/customer_menu/home/model/holiday_service_model.dart';
import 'package:tizela/features/menu/customer_menu/home/model/more_house_section_model.dart';
import 'package:tizela/features/menu/customer_menu/home/model/reviews_model.dart';
import 'package:tizela/features/menu/customer_menu/home/model/shorlet_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/inbox/model/message_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_type_model.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/model/hep_center_faqs.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/model/privacy_policy_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_brand_model.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../features/menu/host_menu/listings/model/apartment_amenities_model.dart';
import '../features/menu/host_menu/listings/model/apartment_detail_model.dart';
import '../features/menu/host_menu/listings/model/apartment_house_rules_model.dart';
import '../features/menu/host_menu/listings/model/boat_cruise_details_model.dart';
import '../features/menu/host_menu/listings/model/boat_cruise_features_model.dart';
import '../features/menu/host_menu/listings/model/car_rental_details_model.dart';
import '../features/menu/host_menu/listings/model/car_rental_features_model.dart';
import '../features/menu/host_menu/listings/model/id_type_model.dart';

class LocalDatabase {
  static List<ServiceTypeModel> stayType = [
    ServiceTypeModel(name: "Ocean View", iconImage: ImagesText.oceanviewIcon),
    ServiceTypeModel(name: "Pool", iconImage: ImagesText.poolIcon),
    ServiceTypeModel(name: "Resort", iconImage: ImagesText.resortIcon),
    ServiceTypeModel(name: "Spa", iconImage: ImagesText.spaIcon),
    ServiceTypeModel(
        name: "Pet Friendly", iconImage: ImagesText.petfriendlyIcon),
  ];

  static List<ServiceTypeModel> carTypes = [
    ServiceTypeModel(name: "Sedan", iconImage: ImagesText.sedanIcon),
    ServiceTypeModel(name: "SUV", iconImage: ImagesText.suvIcon),
    ServiceTypeModel(name: "Van", iconImage: ImagesText.vanIcon),
    ServiceTypeModel(
        name: "Convertible", iconImage: ImagesText.convertibleIcon),
  ];

  static List<BoatTypeModel> boatTypes = [
    BoatTypeModel(boatName: "Yatch", imageUrl: ImagesText.yachtIcon),
    BoatTypeModel(boatName: "Jetski", imageUrl: ImagesText.jetskiIcon),
    BoatTypeModel(boatName: "Boat", imageUrl: ImagesText.boatIcon),
    BoatTypeModel(boatName: "Kayak", imageUrl: ImagesText.kayakIcon),
  ];

  static List<DestinationModel> destinationService = [
    DestinationModel(
        imageUrl: ImagesText.victoriaImage,
        destinationName: "Victoria Island",
        location: "Lagos,Nigeria"),
    DestinationModel(
        imageUrl: ImagesText.lekkiImage,
        destinationName: "Lekki",
        location: "Lagos,Nigeria"),
    DestinationModel(
        imageUrl: ImagesText.mainlandImage,
        destinationName: "Mainland",
        location: "Lagos,Nigeria"),
    DestinationModel(
        imageUrl: ImagesText.ikejaImage,
        destinationName: "Ikeja",
        location: "Lagos,Nigeria"),
  ];

  static final List<String> locations = [
    "All",
    "Lagos",
    "Abuja",
    "Ghana",
    "Benin",
    "Paris"
  ];

  static final List<String> carTypeNames = [
    "All",
    "Sedan",
    "Suv",
    "Trucks",
    "Luxury",
    "Convertible"
  ];

  static final List<MoreHouseSectionModel> variedHouseSectionRooms = [
    MoreHouseSectionModel(houseSection: "All photo", houseSectionCount: 13),
    MoreHouseSectionModel(houseSection: "Bathroom", houseSectionCount: 1),
    MoreHouseSectionModel(houseSection: "Kitchen", houseSectionCount: 3),
    MoreHouseSectionModel(houseSection: "Living room", houseSectionCount: 5),
  ];

  static final List<MoreCarSectionModel> variedCarSections = [
    MoreCarSectionModel(carName: "All photo", sectionCount: 13),
    MoreCarSectionModel(carName: "Interior", sectionCount: 6),
    MoreCarSectionModel(carName: "Rear", sectionCount: 3),
    MoreCarSectionModel(carName: "Side", sectionCount: 13),
  ];

  static final List<String> moreShorletImages = [
    ImagesText.frame1,
    ImagesText.frame2,
    ImagesText.frame3,
    ImagesText.frame4,
    ImagesText.frame5,
    ImagesText.frame6,
    ImagesText.frame7,
    ImagesText.frame8,
    ImagesText.frame9,
    ImagesText.frame10,
    ImagesText.frame11,
    ImagesText.frame13,
    ImagesText.frame14,
  ];

  static final List<String> moreCarRentalImages = [
    ImagesText.car1,
    ImagesText.car2,
    ImagesText.car3,
    ImagesText.car4,
    ImagesText.car5,
    ImagesText.car6,
  ];

  static final List<String> carRental = [
    ImagesText.bmwCar,
    ImagesText.volksCar,
    ImagesText.ferariCar,
  ];
  static final List<String> boatCruise = [
    ImagesText.ship1,
    ImagesText.ship2,
    ImagesText.ship3,
  ];

  static final List<ApartmentTypeModel> apartmentTypes = [
    const ApartmentTypeModel(
      name: "House",
      imageIcon: ImagesText.houseFilterIcon,
    ),
    const ApartmentTypeModel(
      name: "Apartment",
      imageIcon: ImagesText.apartmentIcon,
    ),
    const ApartmentTypeModel(
      name: "Hotel",
      imageIcon: ImagesText.hotelsFilterIcon,
    ),
    const ApartmentTypeModel(
      name: "Resort",
      imageIcon: ImagesText.resortFilterIcon,
    ),
    const ApartmentTypeModel(
      name: "Guest house",
      imageIcon: ImagesText.guestHouseIcon,
    ),
    const ApartmentTypeModel(
      name: "Duplex",
      imageIcon: ImagesText.duplexIcon,
    ),
  ];

  static final List<CarTypeDetailsModel> carTypeDetails = [
    CarTypeDetailsModel("Vehicle details",
        subText: "See amazing vehicle details"),
    CarTypeDetailsModel("Safety features",
        subText: "Prioritize your safety on your trip"),
    CarTypeDetailsModel("Policy",
        subText: "We have your best interest at heart"),
    CarTypeDetailsModel("Driver service",
        subText: "Specify additional services offered by the driver"),
    CarTypeDetailsModel("Reviews",
        subText: "See what other users say the service offered"),
  ];

  static final List<BoatTypeDetailsModel> boatTypeDetails = [
    BoatTypeDetailsModel(
        subText: "See amazing boat details", name: "Boat details"),
    BoatTypeDetailsModel(
        subText: "Prioritize your safety on your cruise",
        name: "Safety features"),
    BoatTypeDetailsModel(
        subText: "We have your best interest at heart", name: "Policy"),
    BoatTypeDetailsModel(
        subText: "Specify additional services offered by the sailor",
        name: "Sailor services"),
    BoatTypeDetailsModel(
        subText: "See what other users say the service offered",
        name: "Reviews"),
  ];

  static final List<ReviewsModel> reviews = [
    ReviewsModel(
      "James Janses",
      reviewText:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Read more",
      rating: 4.5,
    ),
    ReviewsModel(
      "Mike Shulam",
      reviewText:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Read more",
      rating: 4.0,
    ),
    ReviewsModel(
      "Ephraim Paul",
      reviewText:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Read more",
      rating: 3.5,
    ),
    ReviewsModel(
      "Pauline  Thomas",
      reviewText:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Read more",
      rating: 3.8,
    ),
  ];

//packages
  static final List<ShortletModelxxxxxxxxxxxxxxxx> shortletPackages = [
    ShortletModelxxxxxxxxxxxxxxxx(
      id: "001",
      name: "High Valley Villa",
      imageUrl: ImagesText.lounge1,
      cost: "50,000",
      imagesCount: 39,
    ),
    ShortletModelxxxxxxxxxxxxxxxx(
      id: "002",
      name: "Pro Valley Villa",
      imageUrl: ImagesText.lounge2,
      cost: "45,000",
      imagesCount: 25,
    ),
  ];

  static final List<CarRentalModelxxxxxxxxxxx> carRentalPackages = [
    CarRentalModelxxxxxxxxxxx(
        imageUrl: ImagesText.bmwCar,
        name: "BMW M4. Convertible (2016)",
        imagesCount: 12,
        cost: "50,000"),
    CarRentalModelxxxxxxxxxxx(
        imageUrl: ImagesText.volksCar,
        name: "Volkswagen Passat S4 (2014)",
        imagesCount: 10,
        cost: "50,000"),
    CarRentalModelxxxxxxxxxxx(
        imageUrl: ImagesText.ferariCar,
        name: "Ferrari 488 GTB (2022)",
        imagesCount: 10,
        cost: "50,000"),
  ];

  static final List<BoatCruiseModelxxxxxxxx> boatCruisePackages = [
    BoatCruiseModelxxxxxxxx(
      id: "001",
      imageUrl: ImagesText.ship1,
      name: "Bavaria 30 Cruiser (2006)",
      imagesCount: 12,
      cost: "50,000",
      leastPassengerCount: 2,
      maxPassengerCount: 14,
    ),
    BoatCruiseModelxxxxxxxx(
      id: "002",
      imageUrl: ImagesText.ship2,
      name: "Bavaria 30 Cruiser (2006)",
      imagesCount: 12,
      cost: "50,000",
      leastPassengerCount: 2,
      maxPassengerCount: 14,
    ),
    BoatCruiseModelxxxxxxxx(
      id: "003",
      imageUrl: ImagesText.ship3,
      name: "Bavaria 30 Cruiser (2006)",
      imagesCount: 12,
      cost: "50,000",
      leastPassengerCount: 2,
      maxPassengerCount: 14,
    ),
  ];

  static final List<String> durations = [
    "01 hours",
    "02 hours",
    "03 hours",
    "04 hours",
    "05 hours",
    "06 hours",
    "09 hours",
    "10 hours",
    "11 hours",
    "12 hours",
    "13 hours",
  ];

  static final List<MessageModel> messages = [
    MessageModel(
      title: messageTitle,
      dateSent: DateTime.utc(2024, DateTime.september, 6, 9, 10, 30),
      subInformation: messageTitle,
    ),
    MessageModel(
        title: messageTitle,
        dateSent: DateTime.utc(2024, DateTime.september, 6, 7, 20, 30),
        subInformation: messageTitle,
        body: loremIpsum),
    MessageModel(
        title: messageTitle,
        dateSent: DateTime.utc(2024, DateTime.september, 6, 13, 20, 30),
        subInformation: messageTitle,
        body: loremIpsum),
    MessageModel(
        title: messageTitle,
        dateSent: DateTime.utc(2024, DateTime.september, 5, 10, 20, 30),
        subInformation: messageTitle,
        body: loremIpsum),
    MessageModel(
        title: messageTitle,
        dateSent: DateTime.utc(2024, DateTime.september, 5, 8, 16, 30),
        subInformation: messageTitle,
        body: loremIpsum),
    MessageModel(
        title: messageTitle,
        dateSent: DateTime.utc(2024, DateTime.september, 4, 12, 20, 30),
        subInformation: messageTitle,
        body: loremIpsum),
    MessageModel(
        title: messageTitle,
        dateSent: DateTime.utc(2024, DateTime.september, 4, 14, 20, 30),
        subInformation: messageTitle,
        body: loremIpsum),
  ];

  static const List<PrivacyPolicyModel> privacyPolicies = [
    PrivacyPolicyModel(
        index: 1, title: "Type of Data We Collect", body: loremIpsum),
    PrivacyPolicyModel(
        index: 2, title: "Use of Your Personal Data", body: loremIpsum),
    PrivacyPolicyModel(
        index: 3, title: "Disclosure of Your Personal Data ", body: loremIpsum),
    PrivacyPolicyModel(
        index: 4, title: "Security of your account", body: loremIpsum),
    PrivacyPolicyModel(
        index: 5, title: "Transactions compliance", body: loremIpsum),
    PrivacyPolicyModel(index: 6, title: "Refund", body: loremIpsum)
  ];

  static List<HelpCenterFaqsModel> helpCenterShorletFaqs = [
    HelpCenterFaqsModel(title: messageTitle, body: messageBody),
    HelpCenterFaqsModel(title: messageTitle, body: messageBody),
    HelpCenterFaqsModel(title: messageTitle, body: messageBody),
    HelpCenterFaqsModel(title: messageTitle, body: messageBody),
  ];

  static List<HelpCenterFaqsModel> helpCenterCarRentaFaqs = [
    HelpCenterFaqsModel(title: messageTitle2, body: messageBody),
    HelpCenterFaqsModel(title: messageTitle2, body: messageBody),
    HelpCenterFaqsModel(title: messageTitle2, body: messageBody),
    HelpCenterFaqsModel(title: messageTitle2, body: messageBody),
  ];

  static List<HelpCenterFaqsModel> helpCenterBoatCruiseFaqs = [
    HelpCenterFaqsModel(title: messageTitle3, body: messageBody),
    HelpCenterFaqsModel(title: messageTitle3, body: messageBody),
    HelpCenterFaqsModel(title: messageTitle3, body: messageBody),
    HelpCenterFaqsModel(title: messageTitle3, body: messageBody),
  ];

//static List<HostShorletModel> hostshorletList = [];
//static List<HostCarRentalModel> hostcarRentallist = [];
//static List<HostBoatCruiseModel> hostBoatCruiseList = [];

  static List<CarBrandModel> carBrandModels = [
    CarBrandModel(
      id: "1",
      name: "Tesla",
      imageUrl: ImagesText.teslaLogo,
    ),
    CarBrandModel(
      id: "2",
      name: "BMW",
      imageUrl: ImagesText.bmwLogo,
    ),
    CarBrandModel(
      id: "3",
      name: "Ferrari",
      imageUrl: ImagesText.ferariLogo,
    ),
    CarBrandModel(
      id: "4",
      name: "Volks",
      imageUrl: ImagesText.voksLogo,
    ),
  ];

  //host shorlet data
  static List<ApartmentDetailModel> selectedApartmentDetails = [
    ApartmentDetailModel(
      name: "Guests",
      detailCount: 0.obs,
    ),
    ApartmentDetailModel(
      name: "Bedrooms",
      detailCount: 0.obs,
    ),
    ApartmentDetailModel(
      name: "Beds",
      detailCount: 0.obs,
    ),
    ApartmentDetailModel(
      name: "Bathrooms",
      detailCount: 0.obs,
    )
  ];
  static List<ApartmentAmenitiesModel> selectedAmenities = [
    ApartmentAmenitiesModel(name: "Wifi", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Kitchen", isActive: false.obs),
    ApartmentAmenitiesModel(name: "4k tv screen", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Gym", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Free Parking space", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Dedicated workspace", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Washer", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Air conditioning", isActive: false.obs),
  ];
  static List<ApartmentAmenitiesModel> selectedSafetyFeatures = [
    ApartmentAmenitiesModel(name: "Smoke alarm", isActive: false.obs),
    ApartmentAmenitiesModel(name: "First aid", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Fire extinguisher", isActive: false.obs),
  ];
  static List<ApartmentAmenitiesModel> selectedStandOutAmenities = [
    ApartmentAmenitiesModel(name: "Pool", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Beach access", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Lake access", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Gym", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Hot tub", isActive: false.obs),
    ApartmentAmenitiesModel(name: "BBQ grill", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Washer", isActive: false.obs),
    ApartmentAmenitiesModel(name: "Outdoor dining area", isActive: false.obs),
  ];
  static List<ApartmentHouseRulesModel> apartHouseRules = [
    ApartmentHouseRulesModel(
      name: "Are pets allowed",
      yesText: "Yes, they are",
      noText: "No, they not",
      isActive: false.obs,
    ),
    ApartmentHouseRulesModel(
      name: "Is smoking allowed",
      yesText: "Yes, it is",
      noText: "No, it is not",
      isActive: false.obs,
    ),
    ApartmentHouseRulesModel(
      name: "Is partying allowed",
      yesText: "Yes, it is",
      noText: "No, it is not",
      isActive: false.obs,
    ),
  ];
  static RxList<IdTypeModel> availableIdTypes = [
    IdTypeModel(
      uid: "01",
      type: IdTypes.interpassport,
      isActive: false.obs,
      idFiles: [],
    ),
    IdTypeModel(
      uid: "02",
      type: IdTypes.nationalid,
      isActive: false.obs,
      idFiles: [],
    ),
    IdTypeModel(
      uid: "03",
      type: IdTypes.driverlicense,
      isActive: false.obs,
      idFiles: [],
    ),
    IdTypeModel(
      uid: "04",
      type: IdTypes.nin,
      isActive: false.obs,
      idFiles: [],
    ),
    IdTypeModel(
      uid: "05",
      type: IdTypes.voterscard,
      isActive: false.obs,
      idFiles: [],
    ),
  ].obs;
  static List<String> checkInTimes = List.generate(
    24,
    (int time) => "$time:${isAm(time) ? "AM" : "PM"}",
  );
  static List<String> checkOutTimes = List.generate(
    24,
    (int time) => "$time:${isAm(time) ? "AM" : "PM"}",
  );
  static bool isAm(int index) => _am.contains(index);
  static final _am = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
  ];
  static List<String> checkInPeriod = [
    "1 night",
    "2 nights",
    '3 nights',
    '4 nights',
    '5 nights',
    "6 nights"
  ];

//host car rental
  static List<CarRentalDetailsModel> carDetails = [
    CarRentalDetailsModel(
      uid: "01",
      name: "Passengers",
      detailCount: 0.obs,
    ),
    CarRentalDetailsModel(
      uid: "02",
      name: "Seats",
      detailCount: 0.obs,
    ),
    CarRentalDetailsModel(
      uid: "03",
      name: "Luggages",
      detailCount: 0.obs,
    ),
  ];
  static List<CarRentalFeaturesModel> carFeatures = [
    CarRentalFeaturesModel(
      uid: "01",
      name: "Air Conditioning",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "02",
      name: "Bluetooth Connectivity",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "03",
      name: "Navigation System",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "04",
      name: "Sunroof/Moonroof",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "05",
      name: "Leather Seats",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "06",
      name: "Backup Camera",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "07",
      name: "Heated seats",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "08",
      name: "Keyless entry",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "09",
      name: "Apple CarPlay/Android Auto",
      isActive: false.obs,
    ),
  ];
  static List<CarRentalFeaturesModel> carRentalSafetyFeatures = [
    CarRentalFeaturesModel(
      uid: "01",
      name: "Seat Belts",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "02",
      name: "Airbags",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "03",
      name: "Side-Impact Beams",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "04",
      name: "Child Safety Locks",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "05",
      name: "Pedestrain Protection System",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "06",
      name: "Safety Glass",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "07",
      name: "Driver Attention Monitoring",
      isActive: false.obs,
    ),
    CarRentalFeaturesModel(
      uid: "08",
      name: "Surround View Camera System",
      isActive: false.obs,
    ),
  ];
  static List<CarRentalFeaturesModel> carRules = [
    CarRentalFeaturesModel(
        uid: "01", name: "Lorem ipsum policy", isActive: false.obs),
    CarRentalFeaturesModel(
        uid: "02", name: "Lorem ipsum policy", isActive: false.obs),
    CarRentalFeaturesModel(
        uid: "03", name: "Lorem ipsum policy", isActive: false.obs),
    CarRentalFeaturesModel(
        uid: "04", name: "Lorem ipsum policy", isActive: false.obs),
    CarRentalFeaturesModel(
        uid: "05", name: "Lorem ipsum policy", isActive: false.obs),
  ];
  static List<CarRentalFeaturesModel> carRules2 = [
    CarRentalFeaturesModel(
        uid: "01", name: "Lorem ipsum policy", isActive: false.obs),
    CarRentalFeaturesModel(
        uid: "02", name: "Lorem ipsum policy", isActive: false.obs),
    CarRentalFeaturesModel(
        uid: "03", name: "Lorem ipsum policy", isActive: false.obs),
    CarRentalFeaturesModel(
        uid: "04", name: "Lorem ipsum policy", isActive: false.obs),
    CarRentalFeaturesModel(
        uid: "05", name: "Lorem ipsum policy", isActive: false.obs),
  ];
  static List<String> carYears = [
    "1998",
    "2002",
    "2005",
    "2010",
    "2013",
  ];
//host boat cruise
  static List<BoatCruiseDetailsModel> boatDetails = [
    BoatCruiseDetailsModel(
      uid: "01",
      name: "Minimum passenger booking",
      detailCount: 0.obs,
    ),
    BoatCruiseDetailsModel(
      uid: "02",
      name: "Maximum passenger booking",
      detailCount: 0.obs,
    )
  ];
  static List<BoatCruiseFeaturesModel> boatAmenities = [
    BoatCruiseFeaturesModel(
        uid: "01", name: "Entertainment Systems", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "02", name: "Spa Facilities", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "03", name: "Indoor Lounge Areas", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "04", name: "Luxury Cabins", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "05", name: "Spa Facilities", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "06", name: "Gourmet Kitchen", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "07", name: "Bar and Lounge", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "08", name: "Wine and Cigar Lounge:", isActive: false.obs),
  ];
  static List<BoatCruiseFeaturesModel> boatSafety = [
    BoatCruiseFeaturesModel(uid: "01", name: "Life vests", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "02", name: "Fire suppression systems", isActive: false.obs),
    BoatCruiseFeaturesModel(uid: "03", name: "Life boats", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "04", name: "Alarm systems", isActive: false.obs),
  ];
  static List<BoatCruiseFeaturesModel> boatSpecialtyAmenities = [
    BoatCruiseFeaturesModel(uid: "01", name: "Helipad", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "02", name: "Cinema Room:", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "03", name: "Wine and Cigar Loung:", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "04", name: "Alarm systems", isActive: false.obs),
  ];
  static List<BoatCruiseFeaturesModel> boatPolicies = [
    BoatCruiseFeaturesModel(
        uid: "01", name: "Lorem Ipsum dolor sit", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "02", name: "Lorem Ipsum dolor sit", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "03", name: "Lorem Ipsum dolor sit", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "04", name: "Lorem Ipsum dolor sit", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "05", name: "Lorem Ipsum dolor sit", isActive: false.obs),
  ];
  static List<BoatCruiseFeaturesModel> boatSailorPolicies = [
    BoatCruiseFeaturesModel(
        uid: "01", name: "Lorem Ipsum dolor sit", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "02", name: "Lorem Ipsum dolor sit", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "03", name: "Lorem Ipsum dolor sit", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "04", name: "Lorem Ipsum dolor sit", isActive: false.obs),
    BoatCruiseFeaturesModel(
        uid: "05", name: "Lorem Ipsum dolor sit", isActive: false.obs),
  ];

  static List<String> carTypeName = [
    "Sedan",
    "SUV",
    "Hatchback",
    "Convertible",
    "Luxury",
    "Coupe",
    "Van",
    "Minivan"
  ];
}

const String messageTitle = "What is a shorlet";
const String messageTitle2 = "What is car rental";
const String messageTitle3 = "What is a boat cruise";
const String messageBody =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
