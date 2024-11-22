// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;
  final UserType userType;
  String emailAddress;
  String firstName;
  String lastName;
  String phoneNumber;
  DateTime dob;
  String? profilePicture;
  AppUser({
    required this.uid,
    required this.userType,
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dob,
    this.profilePicture,
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
    };
  }

  factory AppUser.empty() => AppUser(
      uid: "",
      userType: UserType.none,
      emailAddress: "",
      firstName: "",
      lastName: "",
      phoneNumber: "",
      dob: DateTime.now());

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
      );
    } else {
      return AppUser.empty();
    }
  }

  String get userFullName => "$firstName $lastName";
}

enum UserType { customer, host, none }
