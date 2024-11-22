

class AddressModel {
  final String addressText;
  // String houseNumber;
  // String streetName;
  // String lga;
  // String state;
  // String? postalCode;
  AddressModel({
    // required this.uid,
    // required this.houseNumber,
    // required this.streetName,
    // required this.lga,
    // required this.state,
    // this.postalCode,
    required this.addressText,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'addressText': addressText,
      // 'houseNumber': houseNumber,
      // 'streetName': streetName,
      // 'lga': lga,
      // 'state': state,
      // 'postalCode': postalCode ?? '',
    };
  }

  factory AddressModel.empty() {
    return AddressModel(
      // uid: "",
      // houseNumber: "",
      // streetName: "",
      // lga: "",
      // state: "",
      addressText: ''
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      addressText: json['addressText'] as String
      // uid: json['uid'] as String,
      // houseNumber: json['houseNumber'] as String,
      // streetName: json['streetName'] as String,
      // lga: json['lga'] as String,
      // state: json['state'] as String,
      // postalCode:
      //     json['postalCode'] != null ? json['postalCode'] as String : '',
    );
  }

}
