// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  String houseNumber;
  String streetName;
  String lga;
  String state;
  String? postalCode;
  AddressModel({
    required this.houseNumber,
    required this.streetName,
    required this.lga,
    required this.state,
    this.postalCode,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'houseNumber': houseNumber,
      'streetName': streetName,
      'lga': lga,
      'state': state,
      'postalCode': postalCode ?? '',
    };
  }

  factory AddressModel.empty() {
    return AddressModel(
        houseNumber: "", streetName: "", lga: "", state: "", postalCode: "");
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      houseNumber: json['houseNumber'] as String,
      streetName: json['streetName'] as String,
      lga: json['lga'] as String,
      state: json['state'] as String,
      postalCode:
          json['postalCode'] != null ? json['postalCode'] as String : '',
    );
  }

  @override
  String toString() => "$houseNumber $streetName $postalCode $lga $state";

  String get addressWithoutPostal => "$houseNumber $streetName $lga $state";

  AddressModel copyWith({
    String? houseNumber,
    String? streetName,
    String? lga,
    String? state,
    String? postalCode,
  }) {
    return AddressModel(
      houseNumber: houseNumber ?? this.houseNumber,
      streetName: streetName ?? this.streetName,
      lga: lga ?? this.lga,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
    );
  }
}
