class BoatTypeModel {
  String boatName, imageUrl;

  BoatTypeModel({required this.boatName, required this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      "name": boatName,
      "imageUrl": imageUrl,
    };
  }

  factory BoatTypeModel.empty() => BoatTypeModel(boatName: "", imageUrl: "");

  factory BoatTypeModel.fromJson(Map<String, dynamic> json) {
    return BoatTypeModel(
      boatName: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
