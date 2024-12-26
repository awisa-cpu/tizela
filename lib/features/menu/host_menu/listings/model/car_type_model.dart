class CarTypeModel {
  String name, imageUrl;
  CarTypeModel({
    required this.imageUrl,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "imageUrl": imageUrl,
    };
  }

  factory CarTypeModel.empty() => CarTypeModel(name: "", imageUrl: "");

  factory CarTypeModel.fromJson(Map<String, dynamic> json) {
    return CarTypeModel(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
