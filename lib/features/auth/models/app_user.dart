// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/enums/id_verification_status.dart';
import '../../../utils/enums/user_type.dart';

class AppUser {
  final String uid;
  final UserType userType;
  String emailAddress;
  String firstName;
  String lastName;
  String phoneNumber;
  DateTime dob;
  String? profilePicture;
  List<String> idDocuments;
  IdVerificationStatus idVerificationStatus;
  String? idRejectionReason;
  DateTime? idVerificationDate;
  AppUser({
    required this.uid,
    required this.userType,
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dob,
    this.profilePicture,
    this.idDocuments = const [],
    this.idVerificationStatus = IdVerificationStatus.none,
    this.idRejectionReason,
    this.idVerificationDate,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userType': userType.name,
      'emailAddress': emailAddress,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'dob': dob.toIso8601String(),
      'profilePicture': profilePicture ?? '',
      "idDocuments":idDocuments,
      "idVerificationStatus": idVerificationStatus.name,
      "idRejectionReason": idRejectionReason ?? "",
      "idVerificationDate": idVerificationDate?.toIso8601String() ?? "",
    };
  }

  factory AppUser.empty() => AppUser(
      uid: "",
      userType: UserType.none,
      emailAddress: "",
      firstName: "",
      lastName: "",
      phoneNumber: "",
      dob: DateTime.now(),
      idDocuments: [],
      idVerificationStatus: IdVerificationStatus.none,
      idRejectionReason: "",
      idVerificationDate: null
      
      );

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'] as String,
      userType:
          UserType.values.firstWhere((type) => type.name == json['userType']),
      emailAddress: json['emailAddress'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      dob: DateTime.parse(json['dob'] as String),
      profilePicture: json['profilePicture'] != null
          ? json['profilePicture'] as String
          : "",
      idDocuments: List<String>.from(json['idDocuments'] as List),
      idVerificationStatus: IdVerificationStatus.values.firstWhere(
          (status) => status.name == json['idVerificationStatus']),
      idRejectionReason: json['idRejectionReason'] as String,
      idVerificationDate: json['idVerificationDate'] != null
          ? DateTime.parse(json['idVerificationDate'] as String)
          : null,
    );
  }

  factory AppUser.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.exists && doc.data() != null) {
      final userData = doc.data()!;
      return AppUser(
        uid: doc.id,
        userType: UserType.values
            .firstWhere((value) => value.name == userData['userType']),
        emailAddress: userData['emailAddress'],
        firstName: userData['firstName'],
        lastName: userData['lastName'],
        phoneNumber: userData['phoneNumber'],
        dob: DateTime.tryParse(userData['dob']) ?? DateTime.now(),
        profilePicture: userData['profilePicture'],
        idDocuments:  List<String>.from(userData['idDocuments']),
        idVerificationStatus: IdVerificationStatus.values.firstWhere(
            (value) => value.name == userData['idVerificationStatus']),
        idRejectionReason: userData['idRejectionReason'],
        idVerificationDate: userData['idVerificationDate'] != null
            ? DateTime.tryParse(userData['idVerificationDate'])
            : null,
      );
    } else {
      return AppUser.empty();
    }
  }

  String get userFullName => "$firstName $lastName";
}


